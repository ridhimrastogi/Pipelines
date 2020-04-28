const fs = require('fs');
const path = require('path');
const chalk = require('chalk');

const sshSync = require('../lib/ssh');


exports.command = 'deploy <project>';
exports.desc = 'Deploy the given project';
exports.builder = yargs => {
    yargs.options('inventory', {
        alias: 'i',
        describe: 'Inventory file',
        type: 'string',
        default: '/bakerx/cm/deploy-inventory.ini'
    });
};


exports.handler = async argv => {
    const {project,inventory} = argv;

    (async () => {

        await run(project,inventory);

    })();

};

async function run(project, inventory) {

    // the paths should be from root of cm directory
    // Transforming path of the files in host to the path in VM's shared folder
    if (project == 'checkbox.io') {
        let filePath =  '/bakerx/' + 'cm/playbook.yml';
        console.log(chalk.blueBright(`Deploying ${project}...`));
        let result = sshSync(`/bakerx/cm/deploy/deploy-checkbox.sh ${filePath} ${inventory}`, 'vagrant@192.168.33.10');
        if (result.error) {
            process.exit(result.status);
        }
    } else if (project == 'iTrust') {
        console.log(project);

        let filePath = '/bakerx/cm/Jenkins_Builds/iTrust/iTrust-deploy.yaml';
        let inventorypath = '/bakerx/cm/jenkins_jobs.ini';
        console.log(chalk.blueBright(`Building ${project}...`));
        // let result = sshSync(`/bakerx/cm/Jenkins_Builds/iTrust/build-iTrust.sh ${filePath} ${inventorypath}`, 'vagrant@192.168.33.20');
        // if (result.error) {
        //     process.exit(result.status);
        // }

        filePath =  '/bakerx/cm/playbook.yml';       
        console.log(chalk.blueBright(`Deploying ${project}...`));
        result = sshSync(`/bakerx/cm/deploy/deploy-iTrust.sh ${filePath} ${inventory}`, 'vagrant@192.168.33.10');
        if (result.error) {
            process.exit(result.status);
        }

        filePath =  '/bakerx/cm/playbook_monitor_push.yml';
        console.log(chalk.yellow(`Pushing Monitor agent to ${project}`));
        result = sshSync(`/bakerx/cm/deploy/deploy-monitor.sh ${filePath} ${inventory}`, 'vagrant@192.168.33.10');
        if (result.error) {
            process.exit(result.status);
        }


    } else {
        console.log("Not yet supported. Try again with checkbox.io or iTrust --gh-user --gh-password")
    }
}
