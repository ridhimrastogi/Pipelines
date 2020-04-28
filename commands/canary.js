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

    let promises = [];

    let requiredServers =[{serverName: 'heartbeat', slug: '512mb' },{serverName: 'blue', slug: '512mb' },{serverName: 'green', slug: '512mb' }];
    let serverInfos = {};

    console.log(chalk.blueBright('Provisioning required servers...'));
    requiredServers.forEach(server => {
        console.log(chalk.yellow('Provisioning server ' + server.serverName));
        promises.push(provision.createDroplet(server.serverName, server.slug));
    });


    await Promise.all(promises).then(function (data) {
        for (let index = 0; index < requiredServers.length; index++) {
            let dropletInfo = data[index];
            serverInfos[dropletInfo.name] = {id: dropletInfo.id, ip_address: dropletInfo.ip_address, name: dropletInfo.name, private_key: "csc_519_rsa_private", user: "root"};
            //console.log(`ID: ${dropletInfo.id} ServerName: ${dropletInfo.name} IP_Address: ${dropletInfo.ip_address}`);
        }
        });

    await updateInventory(serverInfos, blue, green);
    try {
        fs.writeFileSync("cm/canary-analysis/serverInfos.json", JSON.stringify(serverInfos))
      } catch (err) {
        console.error(err)
      }

    await new Promise(r => setTimeout(r, 50000)); //give servers time to boot

    configureServers();  //configure the servers
}

async function updateInventory(serverInfos, blue, green){
    let inventory_stack = [];
    let branch = '';
    //make each server own group
    Object.values(serverInfos).forEach(server => {
        branch = '';
        if(server.name == 'blue')
            branch = blue
        else if(server.name == 'green')
            branch = green
        inventory_stack.push(`[${server.name}]\n${server.ip_address} ansible_ssh_private_key_file=~/.ssh/${server.private_key}    ansible_user=${server.user}\n[${server.name}:vars]\nansible_ssh_common_args='-o StrictHostKeyChecking=no'\nansible_python_interpreter=python3\nbranch=${branch}`);
    });

    inventory_txt = inventory_stack.join("\n") + '\n\n\n';

    let inventory_path = path.join(__dirname, "..", "cm", "canary-analysis", "canary-inventory.ini");
    fs.writeFileSync(inventory_path, inventory_txt, function(err) {
      if(err) throw err;
    });
}

function configureServers(blue, green){
    let filePath =  '/bakerx/' + 'cm/canary-analysis/playbook.yml';
    let inventory_path = '/bakerx/cm/canary-analysis/canary-inventory.ini';
    console.log(chalk.blueBright(`Congifuring the servers`));
    let result = sshSync(`/bakerx/cm/canary-analysis/configure.sh ${filePath} ${inventory_path} ${blue} ${green}`, 'vagrant@192.168.33.10');
    if (result.error) {
        process.exit(result.status);
    }
}


