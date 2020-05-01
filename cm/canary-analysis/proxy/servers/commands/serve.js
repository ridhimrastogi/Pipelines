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
            proxy.web( req, res, {target: self.TARGET, timeout: 10000, proxyTimeout: 10000 } );
        });
        server.listen(3080);
   }

   failover()
   {
	  this.TARGET = GREEN;
   }

   canaryAnalysis(){
		console.log("Switching canaries");
		console.log(chalk`{green Generating traffic for green canary}`);
		this.failover();
		setTimeout(() => {
			clearInterval(this.timer);
			this.generateReport();
		},300000);

   }

   generateReport(){
	   let metrics = fs.readFileSync('/bakerx/cm/canary-analysis/proxy/servers/metrics.csv', 'utf8');
	   let row = metrics.split("\n");
	   let avgBlueCpuLoad = 0;
	   let avgGreenCpuLoad = 0;
	   let blueCount = 0;
	   let greenCount = 0;
	   let lastBlueResponseCode = "";
	   let lastGreenResponseCode = "";
	   let blueCanaryScore = 0;
	   let greenCanaryScore = 0;
	   row.forEach(x => {
			let cols =  x.split(" ");
			if(cols[0] == 'blue'){
					avgBlueCpuLoad = avgBlueCpuLoad + parseInt(cols[1]);
					blueCount++;
					lastBlueResponseCode = cols[3];
				}
				if(cols[0] == 'green'){
					avgGreenCpuLoad = avgGreenCpuLoad + parseInt(cols[1]);
					greenCount++;
					lastGreenResponseCode = cols[3];
				}
	   });

	   avgBlueCpuLoad = Math.round(avgBlueCpuLoad/blueCount);
	   avgGreenCpuLoad = Math.round(avgGreenCpuLoad/greenCount);

	   //Compute blue instance score
	   blueCanaryScore = lastBlueResponseCode == 200 ? 2: 0;
	   if(avgBlueCpuLoad < 80)
			blueCanaryScore++;

		//Compute green instance score
		greenCanaryScore = lastGreenResponseCode == 200 ? 2: 0;
		if(avgGreenCpuLoad < 80 && avgGreenCpuLoad > 0.8 * avgBlueCpuLoad && avgGreenCpuLoad < 1.2 * avgBlueCpuLoad)
			greenCanaryScore++;

	   console.log(chalk`{blueBright BLUE_INSTANCE\t AVG_CPULOAD: ${avgBlueCpuLoad} LAST_RESPONSE_CODE: ${lastBlueResponseCode}} SCORE: ${blueCanaryScore}`);
	   console.log(chalk`{green GREEN_INSTANCE\t AVG_CPULOAD: ${avgGreenCpuLoad} LAST_RESPONSE_CODE: ${lastGreenResponseCode}} SCORE: ${greenCanaryScore}`);

	   console.log("======================================================");
	   if(greenCanaryScore >= 2)
	   {
			console.log(chalk`{green CANARY PASSED}`);
	   }
	   else{
		console.log(chalk`{red CANARY FAILED}`);
	   }
	   console.log("======================================================");
	   process.exit(1);
   }

   generateTraffic()
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
			got.post("http://192.168.44.35:3080/preview", { headers: {'Content-Type': 'application/json'}, body: this.dataString, timeout: 10000, throwHttpErrors: false}).then(function(res){
				let status = res.statusCode;
			});
		}
		catch (error) {
			console.log(error);
		}
   }

}

async function run() {

    console.log(chalk.keyword('pink')('Starting proxy on 192.168.44.35:3080'));
    let prod = new Production();
	prod.proxy();
	console.log(chalk`{blueBright Generating traffic for blue canary}`);
	//generate traffic on blue canary for 5 minutes
	setTimeout(() => { prod.canaryAnalysis(); },300000);
}

//module.exports = new Production();