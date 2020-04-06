# DEVOPS-12

Steps to run:

1. Clone the project
2. Run ```npm install```
3. Run ```npm link```

To run the setup command: ```pipeline setup --gh-user <GitHub User Name> --gh-pass '<GitHub Password>' ```

To build the iTrust database  use command: ```pipeline build iTrust```

To run mutation testing on iTrust test suite use command: ```pipeline useful-tests -c <iterations>```

To start build for checkbox.io use command: ```pipeline build checkbox.io```


# CHECKPOINTS

[Checkpoints](/CHECKPOINT.md)

# MILESTONE 2 REPORT

**Setup**

Below is the basic syntax for provisioning the servers.

*Note: You must enable 'Less secure app access' within your Google Account Security settings for gmail to work*

```pipeline setup --gh-user <GitHub User Name> --gh-pass '<GitHub Password>' --gm-user <Gmail User Name> --gm-pass '<Gmail Password>'```

*Note single quote around passwords. The allows special characters to pass*

**Problems Encountered**
There were various problems encountered while trying to get the iTrust to build and test properly. The main issues were trying to pass the credentials to clone the iTrust repo. This involved several steps to pass the supplied username and password along the chain from the configuration server all the way to the build server, Jenkins. In addition, these credentials had to be made secure, so the credential plugin in Jenkins was used to supply the credentials to GitHub.




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
