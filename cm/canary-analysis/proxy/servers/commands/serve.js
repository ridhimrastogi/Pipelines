const chalk = require('chalk');
const path = require('path');
const os = require('os');
const fs = require('fs');
const got = require('got');
const http = require('http');
const httpProxy = require('http-proxy');

var monitor = require("../../dashboard/metrics/index.js");

exports.command = 'serve';
exports.desc = 'Run traffic proxy.';
exports.builder = yargs => {};

exports.handler = async argv => {
    const { } = argv;

    (async () => {

        await run( );

    })();

};

const BLUE  = 'http://192.168.44.25:3000';
const GREEN = 'http://192.168.44.30:3000';

class Production
{
	constructor()
    {
		this.TARGET = BLUE;
		this.timer = setInterval(this.generateTraffic.bind(this),1);
		this.dataString = fs.readFileSync('/home/vagrant/checkbox.io-micro-preview/test/resources/survey.json', 'utf8');
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
            proxy.web( req, res, {target: self.TARGET } );
        });
        server.listen(3080);
   }

   failover()
   {
	  this.TARGET = GREEN;
	  console.log( chalk`{green ${this.TARGET}}`);
   }

   canaryAnalysis(){
		console.log("Switching canaries\n");
		this.failover();
		setTimeout(() => {
			clearInterval(this.timer);
			this.generateReport();
		},120000);

   }

   generateReport(){
   }

   async generateTraffic()
   {
	   let index = -1;
	   if(this.TARGET == BLUE){
		   index = 0;
	   }
	   else {
		   index = 1;
	   }
		try
		{
			console.log(monitor.servers.server);
			let response = await got.post("http://192.168.44.35:3080/preview", { headers: {'Content-Type': 'application/json'}, body: this.dataString, timeout: 10000, throwHttpErrors: false})
			let status = response.statusCode;
			let setter = {responseCode: status, idx: index}
			monitor.servers.serversInfo = setter;
			console.log( chalk`{grey Health check on ${this.TARGET}}: ${status}`);
		}
		catch (error) {
			console.log(error);
		}
   }

}

async function run() {

    console.log(chalk.keyword('pink')('Starting proxy on localhost:3080'));
    let prod = new Production();
	prod.proxy();
	//generate traffic on blue canary for 50 seconds
	setTimeout(() => { prod.canaryAnalysis(); },120000);
}

//module.exports = new Production();