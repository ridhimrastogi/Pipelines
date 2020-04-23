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
    let serverInfos = JSON.parse(fs.readFileSync("serverInfos.json", 'utf8'));    
    let ansible_IP = serverInfos.find(x => x.name == 'ansiblesrv').ip_address; 
    let jenkins_IP = serverInfos.find(x => x.name == 'jenkinssrv').ip_address;    
    

    result = sshSync(`mkdir /root/DEVOPS-12`, `root@${ansible_IP}`);
    if( result.error ) { process.exit( result.status ); }

    console.log(chalk.blueBright('Installing privateKey on configuration server'));
    let identifyFile = privateKey || path.join(os.homedir(), '.bakerx', 'csc_519_rsa_private');
    console.log(chalk.yellow("Private key path: " + identifyFile));
    result = scpSync (identifyFile, `root@${ansible_IP}:/root/.ssh/js_rsa`);
    if( result.error ) { console.log(result.error); process.exit( result.status ); }

    console.log(chalk.blueBright('scp repo on ansible server'));
    let cm_dir = path.join(__dirname, "..","cm");
    console.log(cm_dir);
    result = scpSync (cm_dir, `root@${ansible_IP}:/root/DEVOPS-12/cm`, true);
    if( result.error ) { console.log(result.error); process.exit( result.status ); }

    console.log(chalk.blueBright('scp repo on ansible server'));
    let test_dir = path.join(__dirname, "..","test");
    console.log(test_dir);
    result = scpSync (test_dir, `root@${ansible_IP}:/root/DEVOPS-12/test`, true);
    if( result.error ) { console.log(result.error); process.exit( result.status ); }

    // console.log(chalk.blueBright('Cloning Repo'));
    // var ghUsrNamNpwd = `${encodeURIComponent(gh_user)}:${encodeURIComponent(gh_pass)}`;
    // console.log(ghUsrNamNpwd);
    // var results = exec(`git clone https://${ghUsrNamNpwd}@github.ncsu.edu/cscdevops-spring2020/DEVOPS-12.git --branch M3`,{user: 'root',host:ansible_IP,key: identifyFile});
    // await new Promise(r => setTimeout(r, 10000));
    // // if( result.error ) { console.log(result.error); process.exit( result.status ); }

    // Run the setup script
    console.log(chalk.blueBright('Running init script...'));
    let server_init = '/root/DEVOPS-12/cm/server-init.sh ' + escapeShell(gh_user) + ' ' + escapeShell(gh_pass) + ' ' + escapeShell(gm_user) + ' ' + escapeShell(gm_pass) + ' ' + ansible_IP + ' ' + 4657 + ' ' + jenkins_IP + ' ' + 8574;
    
    
    
    result = sshSync(server_init, `root@${ansible_IP}`);
    // if( result.error ) { console.log(result.error); process.exit( result.status ); }

    // the paths should be from root of cm directory
    // Transforming path of the files in host to the path in VM's shared folder
    let filePath = '/root/DEVOPS-12/' + 'cm/playbook.yml';
    let inventoryPath = '/root/DEVOPS-12/' + 'cm/inventory.ini';

    console.log(chalk.blueBright('Running ansible playbook script...'));
    result = sshSync(`/root/DEVOPS-12/cm/run-ansible.sh ${filePath} ${inventoryPath}`, `root@${ansible_IP}`);
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

