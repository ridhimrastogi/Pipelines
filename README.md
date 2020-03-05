# DEVOPS-12

Steps to run:

1. Clone the project
2. Run ```npm install```
3. Run ```npm link```

To run the setup command: ```pipeline setup```

To start build for checkbox.io use command: ```pipeline build checkbox.io```

# CHECKPOINTS

[Checkpoints](/CHECKPOINT.md)

# MILESTONE REPORT

Following are some of our team's experiences and issues faced during the course of this milestone:

- **Setting Environment Variables:** This was one of the major issue faced by our team. We encountered this problem when one of our test case started failing during the pipeline build job pertaining to the checkbox.io application. This test case wasn't failing when we were trying to run the ```npm test``` command manually on the server. Later, we were able to figure out the root cause for this test fail, it was because the environment varibale were needed to be set before the installation of jenkins so that the environment variables get configured for the same.  
- **Disable Setup Wizard:** We had to disable the setup wizard so that jenkins installation steps could be completed using commands fired using Ansible and not the Jenkins UI. So for this we had to add the following code to the initialization script(groovy):<br>
```instance.setInstallState(InstallState.INITIAL_SETUP_COMPLETED)```
<br>Also we had to edit the /etc/default/jenkins with the following:<br>
```JAVA_ARGS="-Djava.awt.headless=true -Djenkins.install.runSetupWizard=false```
- **Jenkins Plugin Installation:** While configuring the Jenkins server, we needed some plugins for the jenkins build job to be triggred as part of the project narrative, during installation of these plugins the jenkins server was required to be restarted and hence we had to add wait and retries as part of the ansible tasks so as to enforce successful installation of the plugins.
- **Checking Build Status:** Typically, the build status is available on the jenkins UI, but for the project we had to print the build console output logs on the terminal, in order to accomplish this task we had to parse the result of the curl request used for polling the build status using "jq-command line json processor". We had also considered using python's json module to parse the API response.

# SCREENCAST

[Milestone-1-Demo](https://drive.google.com/open?id=191yoG7N7pT8X15-aBgCq6R6OBXGqNV65)
