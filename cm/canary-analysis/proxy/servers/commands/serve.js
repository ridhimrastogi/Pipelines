// websocket server that dashboard connects to.
const redis = require('redis');
const got = require('got');
const path = require('path');
const fs = require('fs');
const chalk = require('chalk');
const http = require('http');
const httpProxy = require('http-proxy');

const BLUE  = 'http://192.168.44.25:3000';
const GREEN = 'http://192.168.44.30:3000';

/// Servers data being monitored.
var servers =
[
	{name: "blue",url:'http://192.168.44.25:3000/preview',avgcpuload: 0,responseCode: 0},
	{name: "green",url:'http://192.168.44.30:3000/preview',avgcpuload: 0,responseCode: 0}
];

exports.command = 'serve';
exports.desc = 'Run traffic proxy.';
exports.builder = yargs => {};

exports.handler = async argv => {
    const { } = argv;

    (async () => {

        await run( );

    })();

};

class Production
{
    constructor(instance)
    {
        this.TARGET = instance;
        setInterval( this.healthCheck.bind(this), 5000 );
    }

    // TASK 1:
    proxy()
    {
        let options = {};
        let proxy   = httpProxy.createProxyServer(options);
        let self = this;
        // Redirect requests to the active TARGET (BLUE or GREEN)
        let server  = http.createServer(function(req, res)
        {
            // callback for redirecting requests.
            proxy.web( req, res, {target: self.TARGET.url } );
        });
		server.listen(3080);

		let client = redis.createClient(6379, 'localhost', {});
		// We subscribe to all the data being published by the server's metric agent.
		for( var instance of servers )
		{
			// The name of the server is the name of the channel to recent published events on redis.
			client.subscribe(instance.name);
		}

		//client.subscribe(this.TARGET.name);
		// When an agent has published information to a channel, we will receive notification here.
		client.on("message", function (channel, message)
		{
			console.log(`Received message from agent: ${channel}`)
			for( var instance of servers )
			{
				// Update our current snapshot for a server's metrics.
				if( instance.name == channel)
				{
					let payload = JSON.parse(message);
					instance.memoryLoad = payload.memoryLoad;
					instance.cpu = payload.cpu;
				}
			}
		});
   }

   failover(instance)
   {
      this.TARGET = instance;
   }

   async healthCheck()
   {
	  var dataString = JSON.parse(fs.readFileSync('/home/vagrant/checkbox.io-micro-preview/test/resources/survey.json', 'utf8'));
      try
      {
         const response = await got.post(this.TARGET.url, { headers: {'Content-Type': 'application/json'}, json: dataString, timeout: 5000, throwHttpErrors: false});
		 this.TARGET.responseCode = response.statusCode;
		 this.TARGET.avgcpuload = (this.TARGET.avgcpuload + this.TARGET.cpu)/2;
         console.log( chalk`{grey Health check on ${this.TARGET.name}}: ${this.TARGET.responseCode}`);
      }
      catch (error) {
         console.log(error);
      }
   }
}

async function run() {

    console.log(chalk.keyword('pink')('Starting proxy on 192.168.44.35:3080'));
	let starttime = Date.now();
	let prod = new Production(servers[0]);
	prod.proxy();
	while(Date.now() - starttime <= 10000)
	{}
	prod.failover(servers[1]);
	starttime = Date.now();
	while(Date.now() - starttime <= 10000)
	{}
	console.log(servers)
	if(servers[1].responseCode != 200 ||
		 (servers[1].avgcpuload > 1.2 * servers[0].avgcpuload || servers[1].avgcpuload < 0.8 * servers[0].avgcpuload)){
			console.log(chalk.keyword('red')('Canary Failed'));
			prod.failover(servers[0]);
	} else {
		console.log(chalk.keyword('green')('Canary Passed'));
	}


}