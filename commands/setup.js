const child = require('child_process');
const chalk = require('chalk');
const path = require('path');
const os = require('os');
const fs = require('fs');
let exec = require('ssh-exec');


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
    }).positional('gm-user', {
        alias: 'gm_user',
        describe: 'gmail user',
        type: 'string',
        nargs: 1
    }).positional('gm-pass', {
        alias: 'gm_pass',
        describe: 'gmail user password',
        type: 'string',
        nargs: 1
    });
};


exports.handler = async argv => {
    const { privateKey, gh_user, gh_pass, gm_user, gm_pass } = argv;

    (async () => {

        await run( privateKey, gh_user, gh_pass, gm_user, gm_pass );

    })();

};

async function run(privateKey, gh_user, gh_pass, gm_user, gm_pass) {
    let serverInfos = JSON.parse(fs.readFileSync("cm/serverInfos.json", 'utf8')); 
    
    console.log(chalk.blueBright('Setup Inventory.ini file'));
    let inventory_txt;
    let inventory_stack = [];
    //group all servers under initialize
    inventory_stack.push('[initialize]')
    Object.values(serverInfos).forEach(server => {
        if(server.name != 'ansiblesrv') {
            inventory_stack.push(`${server.ip_address} ansible_ssh_private_key_file=~/.ssh/js_rsa    ansible_user=root`);
        }
    });
    inventory_stack.push(`[initialize:vars]\nansible_ssh_common_args='-o StrictHostKeyChecking=no'`)
    inventory_txt = inventory_stack.join("\n") + '\n\n\n';
    inventory_stack = [];

    //make each server own group
    Object.values(serverInfos).forEach(server => {
        inventory_stack.push(`[${server.name}]\n${server.ip_address} ansible_ssh_private_key_file=~/.ssh/js_rsa    ansible_user=root\n[${server.name}:vars]\nansible_ssh_common_args='-o StrictHostKeyChecking=no'`);
    });
    inventory_txt = inventory_txt + inventory_stack.join("\n") + '\n\n\n';

    let inventory_path = path.join(__dirname, "..", "cm", "inventory.ini");   
    fs.writeFileSync(inventory_path, inventory_txt, function(err) {
      if(err) throw err;
    });

    console.log(chalk.blueBright('Installing privateKey on configuration server'));
    result = sshSync(`mkdir -p /root/DEVOPS-12`, `root@${serverInfos.ansiblesrv.ip_address}`);
    if( result.error ) { process.exit( result.status ); }
    
    let identifyFile = privateKey || path.join(os.homedir(), '.bakerx', 'csc_519_rsa_private');
    console.log(chalk.yellow("Private key path: " + identifyFile));
    result = scpSync (identifyFile, `root@${serverInfos.ansiblesrv.ip_address}:/root/.ssh/js_rsa`);
    if( result.error ) { console.log(result.error); process.exit( result.status ); }

    console.log(chalk.blueBright('scp repo on ansible server'));
    let cm_dir = path.join(__dirname, "..","cm");
    console.log(cm_dir);
    result = scpSync (cm_dir, `root@${serverInfos.ansiblesrv.ip_address}:/root/DEVOPS-12/cm`, true);
    if( result.error ) { console.log(result.error); process.exit( result.status ); }

    console.log(chalk.blueBright('scp repo on ansible server'));
    let test_dir = path.join(__dirname, "..","test");
    console.log(test_dir);
    result = scpSync (test_dir, `root@${serverInfos.ansiblesrv.ip_address}:/root/DEVOPS-12/test`, true);
    if( result.error ) { console.log(result.error); process.exit( result.status ); }


    // Run the setup script
    console.log(chalk.blueBright('Running init script...'));
    let server_init = 'DEVOPS-12/cm/server-init.sh ' + escapeShell(gh_user) + ' ' + escapeShell(gh_pass) + ' ' + escapeShell(gm_user) + ' ' + escapeShell(gm_pass) + ' ' + serverInfos.ansiblesrv.ip_address + ' ' + 4657 + ' ' + serverInfos.jenkinssrv.ip_address + ' ' + 8574;
    console.log(server_init);
    result = sshSync(server_init, `root@${serverInfos.ansiblesrv.ip_address}`);
    // if( result.error ) { console.log(result.error); process.exit( result.status ); }

    // the paths should be from root of cm directory
    // Transforming path of the files in host to the path in VM's shared folder
    let filePath = '~/DEVOPS-12/' + 'cm/playbook.yml';
    let inventoryPath = '~/DEVOPS-12/' + 'cm/inventory.ini';

    console.log(chalk.blueBright('Running ansible playbook script...'));
    result = sshSync(`~/DEVOPS-12/cm/run-ansible.sh ${filePath} ${inventoryPath}`, `root@${serverInfos.ansiblesrv.ip_address}`);
    // if( result.error ) { process.exit( result.status ); }

}

var escapeShell = function(cmd) {
    if(cmd != null) {
        return '"'+ cmd.replace(/(["\s'$`\\])/g,'\\$1')+'"';
    }
    else    
    {
        return;
    }
  };

