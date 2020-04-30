
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

    let servers = JSON.parse(fs.readFileSync("/root/Monitor/servers/serverInfos_DigitalOcean.json", 'utf8')); 

    Object.values(servers).forEach(server => 
    {
        let port=22;

        console.log(chalk.keyword('pink')(`Updated agent on server: ${server.name}`));
        // agent/index.js
        result = scpSync (port, agentJS, `root@${server.ip_address}:/root/agent.js`);
        if( result.error ) { console.log(result.error); process.exit( result.status ); }

        // agent/package.json
        result = scpSync (port, package, `root@${server.ip_address}:/root/package.json`);
        if( result.error ) { console.log(result.error); process.exit( result.status ); }

        if( process.platform=='win32')
        {
            result = sshSync(`"if forever list | grep -q agent.js; then forever stop agent.js; fi"`, `root@${server.ip_address}`, port);
            result = sshSync(`"npm install && forever start agent.js ${server.name}"`, `root@${server.ip_address}`, port);
        }
        else
        {
            result = sshSync(`'if forever list | grep -q agent.js; then forever stop agent.js; fi'`, `root@${server.ip_address}`, port);
            result = sshSync(`'npm install && forever start agent.js ${server.name}'`, `root@${server.ip_address}`, port);
        }
        if( result.error ) { console.log(result.error); process.exit( result.status ); }
    });




}


