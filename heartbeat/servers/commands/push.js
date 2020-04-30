
const child = require('child_process');
const chalk = require('chalk');
const path = require('path');
const fs = require('fs');

const sshSync = require('../lib/ssh');
const scpSync = require('../lib/scp');
const VBox = require('../lib/VBoxManage');

exports.command = 'push';
exports.desc = 'Install and update monitoring agent running on servers';
exports.builder = yargs => {
    yargs.options({
    });
};


exports.handler = async argv => {
    const {} = argv;

    (async () => {

        await run( );

    })();

};

async function run() {

    console.log(chalk.greenBright('Pushing monitoring agent to servers...'));

    let agentJS = path.join(__dirname, '../../agent/index.js');
    let package = path.join(__dirname, '../../agent/package.json');

    // let servers = ['alpine-01', 'alpine-02', 'alpine-03'];

    let servers = JSON.parse(fs.readFileSync("Heartbeat/servers/serverInfos_VBox.json", 'utf8')); 

    Object.values(servers).forEach(server => 
    {
        let port = 22;
        console.log(`Port: ${port}`);
        if(server.name == 'blue' || server.name == 'green'){

                console.log(chalk.keyword('pink')(`Updated agent on server: ${server.name}`));
                // agent/index.js
                console.log(chalk.yellow("Sending agent file"));
                result = scpSync (port, agentJS, `vagrant@${server.ip_address}:/home/vagrant/agent.js`);
                if( result.error ) { console.log(result.error); process.exit( result.status ); }

                // agent/package.json
                console.log(chalk.yellow("Sending package.json file"));
                result = scpSync (port, package, `vagrant@${server.ip_address}:/home/vagrant/package.json`);
                if( result.error ) { console.log(result.error); process.exit( result.status ); }

                if( process.platform=='win32')
                {
                    result = sshSync(`"if forever list | grep -q agent.js; then forever stop agent.js; fi"`, `vagrant@${server.ip_address}`, port);
                    result = sshSync(`"npm install && forever start agent.js ${server.name}"`, `vagrant@${server.ip_address}`, port);
                }
                else
                {
                    result = sshSync(`'if forever list | grep -q agent.js; then forever stop agent.js; fi'`, `vagrant@${server.ip_address}`, port);
                    result = sshSync(`'npm install && forever start agent.js ${server.name}'`, `vagrant@${server.ip_address}`, port);
                }
                if( result.error ) { console.log(result.error); process.exit( result.status ); }

        }
        
    });




}


