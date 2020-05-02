# DEVOPS-12

**Setup**

1. Clone the project
2. Run ```npm install```
3. Run ```npm link```

## Prerequisite

**Environment variables on local machine**

- NCSU_DOTOKEN - Digital ocean api token
- VM_Pub_Key_FingerPrint - Fingerprint of the SSH key that is registered with your digital ocean account.

## Commands

1. Run the setup command.

    ```pipeline setup --gh-user <GitHub User Name> --gh-pass '<GitHub Password>' --gm-user <Gmail User Name> --gm-pass '<Gmail Password>'```

#### - *Note:* 
- --gm-user and --gm-pass are optional fields. If not provided default values will be used
- If using your personal gmail account You must enable 'Less secure app access' within your Google Account Security settings for   gmail to work
- Single quote around passwords with special characters are expected

This command creates the ansible and jenkins VM on your local machine.

2. Provision the VM on Digital ocean 

    ```pipeline prod up```
    
This command creates the mointor, checkbox and iTrust servers on Digital Ocean. It also configures the monitor server.    

#### - *Note:*
    - The monitor dashboard gets deployed on http://{monitor_ip_address}:8080
 
3. Deploy Checkbox application

    ```pipeline deploy checkbox.io -i inventory.ini```
    
 This command setups the production environment for checkbox, deploys the appliction. It also starts the metric collection from checkbox.io server.
 
 #### - *Note:* 
- The checkbox application gets deployed on http://{checkbox_ip_address}
- The inventory file needs to be present inside the "cm" directory to ensure that the inventory file is available on the Ansible server. The path to the inventory file should include '/bakerx/cm/'.   
- If this command is run before running prod up, the metric collection code will throw error since it requires the monitor server to be set up. However, the checkbox application still gets deployed without any errors.

4. Deploy iTrust application

    ```pipeline deploy iTrust -i inventory.ini```

This command setups the production environment for iTrust, deploys the appliction. It also starts the metric collection from iTrust server.

#### - *Note:* 
- The iTrust application gets deployed on http://{iTrust_ip_address}:8080/iTrust2
- The inventory file needs to be present inside the "cm" directory to ensure that the inventory file is available on the Ansible    server. The path to the inventory file should include '/bakerx/cm/'.    
-  If this command is run before running prod up, the metric collection code will throw error since it requires the monitor server to be set up. However, the iTrust application still gets deployed without any errors.

5. Run canary analysis 

    ```pipeline canary master broken```
    
 This command performs canary analysis on the given branches. A report is generated and displayed on the console which shows the canary  score. The canary score is computed using the Average CPU Load and the response code received.  

# MILESTONE 3 REPORT

- **Monitor Control Plane:** The main issue during this phase of development was getting the Monitor/Heartbeat planes to work properly in the differnent environments, DigtialOcean and Virtual Box. The Monitor plane setup for the DigitalOcean was fairly straight forward using the pre-existing codebase from the Monitor workshop. However, the memory usage seems to always be ~90% usage dispite using several parameters from the [SystemInformation library.](https://www.npmjs.com/package/systeminformation#4-memory) The Heartbeat monitoring for th canary data collection was a bit more difficult to implement due to some confusion about what private key to use, insecure_private_key or baker_rsa, in addition to which user to use, root or vagrant. Also, since the program plane had changed, the name of the key alias on the remote server, so the scp.js and ssh.js files had to be updated as well. After these issues were resolved, collecting and reporting CPU and Memory Usage metrics were straight forward.

- **Deployment**: The main roadblock for the task was configuring the web servers. The configuration of the Nginx server for the Checkbox.io application was a big task in itself. In order to accomplish this task we had to go to through the Nginx documentation and gain knowledge about the various configuration directives. For Tomcat server, we found the guide at [Digital Ocean](https://www.digitalocean.com/community/tutorials/install-tomcat-9-ubuntu-1804) helpful and accurate, except the part for setting up the Host Manager. An additional challenge for deploying the iTrust application was exporting the MySql database on the iTrust instance.

- **Canary Analysis**: A major hurdle in the canary analysis was to communicate the metrics collected by the monitoring server with the proxy server. While both servers were configured on the same machine, nodejs makes sharing of variables across files while maintaing their integrity challenging. In the end we wrote the required metrics to a file to overcome this. 


# CHECKPOINTS

[Checkpoints](/CHECKPOINT.md)

# MILESTONE 2 REPORT

Following are some of our team's experiences and issues faced during the course of this milestone:

- **Passing github credentials:** The main issues were trying to pass the credentials to clone the iTrust repo. This involved several steps to pass the supplied username and password along the chain from the configuration server all the way to the build server, Jenkins. In addition, these credentials had to be made secure, so the credential plugin in Jenkins was used to supply the credentials to GitHub.

- **Mutation Testing:** A major issue in mutation testing was to parse the results from the test suite run. There were a couple of ways to so this including one where test results were read from the reports generated. Since the report was generated for each tets case individually and not for the entire test suite this approach was cumbersome and we decided to parse the console output itself for the task.

- **Static Analysis:** To calculate the MaxNestingDepth required a lot of experimentation to ensure that all test cases were covered. Esprima Parser playground was a huge help to manually analyze the code which enabled us to customise our algorithm for metric calculation for static analysis. We looked around for best practices to fail the Jenkins build on vioalation of static analysis meetric thersholds and finally zeroed upon the usage of process module of Node.js 

[Milestone-2-Demo](https://drive.google.com/open?id=1pNf79gE533QLjLZNuTZmQgOTJUhDcMvZ)

# MILESTONE 1 REPORT

Following are some of our team's experiences and issues faced during the course of this milestone:

- **Setting Environment Variables:** This was one of the major issues faced by our team. We encountered this problem when one of the test case started failing during the pipeline build job for the checkbox.io application. This test case wasn't failing when we were trying to run the ```npm test``` command manually on the server. We were able to figure out the root cause for this test failure; which was that the environment variables were needed to be set before the installation of jenkins so that the environment variables get configured for the same.  
- **Disable Setup Wizard:** We had to disable the setup wizard so that jenkins installation steps could be completed using commands fired via Ansible and not the Jenkins UI. So for this we had to add the following code to the initialization script(groovy):<br>
```instance.setInstallState(InstallState.INITIAL_SETUP_COMPLETED)```
<br>Also we had to edit the /etc/default/jenkins with the following:<br>
```JAVA_ARGS="-Djava.awt.headless=true -Djenkins.install.runSetupWizard=false```
- **Jenkins Plugin Installation:** While configuring the Jenkins server, we needed some plugins for the jenkins build job to be triggred as part of the project narrative. Installation of Jenkins plugins via UI is a piece of cake, it just takes a single click. But during the installation of these plugins via Ansible tasks, we encountered several kinds of task failures. So in order to overcome these task failures and enforce the successful installation of the plugins we had to add handlers of jenkins server restart and wait for jenkins to be up and running, we also had to add ansible task retires.
- **Checking Build Status:** Typically, the build status is available on the jenkins UI, but for the project we had to print the build console output logs on the terminal. In order to accomplish this task we had to parse the result of the curl request used for polling the build status using "jq-command line json processor". We had also considered using python's json module to parse the API response.

# SCREENCAST

[Milestone-1-Demo](https://drive.google.com/open?id=191yoG7N7pT8X15-aBgCq6R6OBXGqNV65)
