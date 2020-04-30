const redis = require('redis');
const util  = require('util');
const os = require('os');
const si = require('systeminformation');

// Calculate metrics.
// TASK 1:
class Agent
{
    async memoryLoad()
    {
       // console.log( os.totalmem(), os.freemem() );
       let avgMem = 0;
       await si.mem().then(data => {
         avgMem = (data.used / data.total) * 100;
         avgMem = Math.round(avgMem * 100 ) / 100; //round to nearest 100th
        });
       return avgMem;   
    }
    async cpu()
    {
       let load = await si.currentLoad();
       return Math.trunc(load.currentload * 100) / 100;
    }
}

(async () => 
{
    // Get agent name from command line.
    let args = process.argv.slice(2);
    main(args[0]);

})();


async function main(name)
{
    let agent = new Agent();

    let connection = redis.createClient(6379, "192.168.44.35", {})
    connection.on('error', function(e)
    {
        console.log(e);
        process.exit(1);
    });
    let client = {};
    client.publish = util.promisify(connection.publish).bind(connection);

    // Push update ever 1 second
    setInterval(async function()
    {
        let payload = {
            memoryLoad: await agent.memoryLoad(),
            cpu: await agent.cpu()
        };
        let msg = JSON.stringify(payload);
        await client.publish(name, msg);
        console.log(`${name} ${msg}`);
    }, 1000);

}



