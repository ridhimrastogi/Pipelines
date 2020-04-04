const child = require('child_process');
const chalk = require('chalk');
const path = require('path');
const os = require('os');
const fs = require('fs');

const scpSync = require('../lib/scp');
const sshSync = require('../lib/ssh');

exports.command = 'setup';
exports.desc = 'Provision and configure the configuration server';
exports.builder = yargs => {
    yargs.options({
        privateKey: {
            describe: 'Install the provided private key on the configuration server',
            type: 'string'
        }
    }).positional('gh-user', {
        alias: 'gh_user',
        describe: 'user name',
        type: 'string',
        nargs: 1
    }).positional('gh-pass', {
        alias: 'gh_pass',
        describe: 'user password',
        type: 'string',
        nargs: 1
    });
};


exports.handler = async argv => {
    const { privateKey, gh_user, gh_pass } = argv;

    (async () => {

        await run( privateKey, gh_user, gh_pass );

    })();

};

async function run(privateKey, gh_user, gh_pass) {

    console.log(chalk.blueBright('Provisioning configuration server...'));
    let result = child.spawnSync(`bakerx`, `run ansible-srv bionic --ip 192.168.33.10 --sync`.split(' '), {shell:true, stdio: 'inherit'} );
    if( result.error ) { console.log(result.error); process.exit( result.status ); }

    console.log(chalk.blueBright('Provisioning jenkins server...'));
    result = child.spawnSync(`bakerx`, `run jenkins-srv bionic --ip 192.168.33.20 --sync`.split(' '), {shell:true, stdio: 'inherit'} );
    if( result.error ) { console.log(result.error); process.exit( result.status ); }

    console.log(chalk.blueBright('Installing privateKey on configuration server'));
    let identifyFile = privateKey || path.join(os.homedir(), '.bakerx', 'insecure_private_key');
    result = scpSync (identifyFile, 'vagrant@192.168.33.10:/home/vagrant/.ssh/js_rsa');
    if( result.error ) { console.log(result.error); process.exit( result.status ); }

    // Run the setup script
    console.log(chalk.blueBright('Running init script...'));
    let server_init = '/bakerx/cm/server-init.sh ' + escapeShell(gh_user) + ' ' + escapeShell(gh_pass) ;
    console.log(server_init);
    result = sshSync(server_init, 'vagrant@192.168.33.10');
    if( result.error ) { console.log(result.error); process.exit( result.status ); }

    // the paths should be from root of cm directory
    // Transforming path of the files in host to the path in VM's shared folder
    let filePath = '/bakerx/' + 'cm/playbook.yml';
    let inventoryPath = '/bakerx/' + 'cm/inventory.ini';

    console.log(chalk.blueBright('Running ansible playbook script...'));
    result = sshSync(`/bakerx/cm/run-ansible.sh ${filePath} ${inventoryPath}`, 'vagrant@192.168.33.10');
    if( result.error ) { process.exit( result.status ); }

}

var escapeShell = function(cmd) {
    return '"'+ cmd.replace(/(["\s'$`\\])/g,'\\$1')+'"';
  };
