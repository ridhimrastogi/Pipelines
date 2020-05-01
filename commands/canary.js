const child = require('child_process');
const chalk = require('chalk');
const path = require('path');
const os = require('os');
const fs = require('fs');

const scpSync = require('../lib/scp');
const sshSync = require('../lib/ssh');
const provision = require('../lib/provision');

exports.command = 'canary <blue> <green>';
exports.desc = 'Create an automated analysis that generates a canary score';
exports.builder = yargs => {
    yargs.options({})
};


exports.handler = async argv => {
    const { blue, green } = argv;

    (async () => {

        await run( blue, green );

    })();

};

async function run(blue, green) {

    console.log(chalk.blueBright('Provisioning proxy server...'));
    let result = child.spawnSync(`bakerx`, `run proxy queues --ip 192.168.44.35 --sync`.split(' '), {shell:true, stdio: 'inherit'} );
    if( result.error ) { console.log(result.error); process.exit( result.status ); }

    console.log(chalk.blueBright('Provisioning blue server...'));
    result = child.spawnSync(`bakerx`, `run blue queues --ip 192.168.44.25 --sync`.split(' '), {shell:true, stdio: 'inherit'} );
    if( result.error ) { console.log(result.error); process.exit( result.status ); }

    console.log(chalk.blueBright('Provisioning green server...'));
    result = child.spawnSync(`bakerx`, `run green queues --ip 192.168.44.30 --sync`.split(' '), {shell:true, stdio: 'inherit'} );
    if( result.error ) { console.log(result.error); process.exit( result.status ); }

    let filePath =  '/bakerx/cm/canary-analysis/playbook.yml';
    let inventory_path = '/bakerx/cm/canary-analysis/canary-inventory.ini';
    console.log(chalk.blueBright(`Congifuring the servers`));
    result = sshSync(`/bakerx/cm/canary-analysis/configure.sh ${filePath} ${inventory_path} ${blue} ${green}`, 'vagrant@192.168.33.10');
    if (result.error) {
        process.exit(result.status);
    }

    result = sshSync(`/bakerx/cm/canary-analysis/analysis.sh`, 'vagrant@192.168.44.35');
    if (result.error) {
        process.exit(result.status);
    }
}

