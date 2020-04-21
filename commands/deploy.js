const fs = require('fs');
const path = require('path');
const chalk = require('chalk');

const sshSync = require('../lib/ssh');


exports.command = 'deploy <project>';
exports.desc = 'Deploy the given project';
exports.builder = yargs => {
    yargs.options({
    });
};


exports.handler = async argv => {
    const { project } = argv;

    (async () => {

        await run(project);

    })();

};

async function run(project) {
    
    // the paths should be from root of cm directory
    // Transforming path of the files in host to the path in VM's shared folder
    if (project == 'checkbox.io') {
        let filePath = '~/DEVOPS-12/cm/Jenkins_Builds/checkbox/checkbox.yaml';
        let inventorypath = '~/DEVOPS-12/cm/jenkins_jobs.ini';
        console.log(chalk.blueBright(`Deploying ${project}...`));
        let result = sshSync(`~/DEVOPS-12/cm/Jenkins_Builds/checkbox/build-checkbox.sh ${filePath} ${inventorypath}`, `root@${process.env.jenkinssrv_IP}`);
        if (result.error) { process.exit(result.status); }
    }
    
    else  if (project == 'iTrust') {
        console.log(project);
        let filePath = '~/DEVOPS-12/cm/Jenkins_Builds/iTrust/iTrust.yaml';
        let inventorypath = '~/DEVOPS-12/cm/jenkins_jobs.ini';
        console.log(chalk.blueBright(`Deploying ${project}...`));
        let result = sshSync(`~/DEVOPS-12/cm/Jenkins_Builds/iTrust/build-iTrust.sh ${filePath} ${inventorypath}`, `root@${process.env.jenkinssrv_IP}`);
        if (result.error) { process.exit(result.status); 
        }
    
    else {
        console.log("Not yet supported. Try again with checkbox.io or iTrust --gh-user --gh-password")
    }

    }

}
