const fs = require('fs');
const path = require('path');
const chalk = require('chalk');
const provision = require('../lib/provision');


exports.command = 'prod <status>';
exports.desc = 'provision VMs';
exports.builder = yargs => {
    yargs.options({
    });
};


exports.handler = async argv => {
    const { status } = argv;

    (async () => {

        await run(status);

    })();

};

async function run(status) {    
    let promises = [];
    
    if (status == 'up') {                
        let requiredServers =[{serverName: 'ansiblesrv', slug: '512mb' },{serverName: 'monitorsrv', slug: '512mb' },{serverName: 'jenkinssrv', slug: 's-2vcpu-4gb' },{serverName: 'checkboxiosrv', slug: '512mb' },{serverName: 'itrustsrv', slug: '512mb' }];
        let serverInfos = {};
        

        console.log(chalk.blueBright('Provisioning required servers...'));
        requiredServers.forEach(server => {
            console.log(chalk.yellow('Provisioning server ' + server.serverName));
            promises.push(provision.createDroplet(server.serverName, server.slug) );
        });        
       

        await Promise.all(promises).then(function (data) { 
            for (let index = 0; index < requiredServers.length; index++) {
                let dropletInfo = data[index];                
                serverInfos[dropletInfo.name] = {id: dropletInfo.id, ip_address: dropletInfo.ip_address, name: dropletInfo.name};
                //console.log(`ID: ${dropletInfo.id} ServerName: ${dropletInfo.name} IP_Address: ${dropletInfo.ip_address}`);
            }            
         });

         //save sever info to file
         try {
            fs.writeFileSync("cm/serverInfos.json", JSON.stringify(serverInfos))
          } catch (err) {
            console.error(err)
          }

        await new Promise(r => setTimeout(r, 30000)); //give servers time to boot


        // if( result.error ) { console.log(result.error); process.exit( result.status ); }
    } 
    else if (status == "down") {

        try {
            serverInfos = JSON.parse(fs.readFileSync("cm/serverInfos.json", 'utf8'));            
            Object.values(serverInfos).forEach(element => {                 
                promises.push(provision.destroyDroplet(element.id));
            });
            await Promise.all(promises).then(() => console.log(chalk.blueBright("Tear down complete")));
          } catch (err) {
            console.error(err)
            return false
          }

    }     
    
    else {
        console.log("Given status not supported.");
    }



}
