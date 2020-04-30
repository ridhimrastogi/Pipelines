const chalk = require('chalk');
const path = require('path');
const os = require('os');
const fs = require('fs');
const got = require('got');
const http = require('http');
const httpProxy = require('http-proxy');

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
		this.timer = setInterval(this.generateTraffic.bind(this),1000);
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
		},50000);
   }

   generateReport(){
	   console.log("CANARY PASSED/FAILED");
   }

   async generateTraffic()
   {
		try
		{
			const response = await got.post("http://192.168.44.35:3080/preview", { headers: {'Content-Type': 'application/json'}, body: this.dataString, timeout: 10000, throwHttpErrors: false});
			let status = response.statusCode == 200 ? chalk.green(response.statusCode) : chalk.red(response.statusCode);
			// if(response.statusCode != 200)
			// 	this.failover();
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
	setTimeout(() => { prod.canaryAnalysis(); },50000);
}