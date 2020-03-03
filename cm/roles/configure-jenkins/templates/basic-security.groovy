#!groovy

import jenkins.model.*
import hudson.security.*
import jenkins.install.InstallState

def instance = Jenkins.getInstance()

println "--> creating local user 'admin'"

def hudsonRealm = new HudsonPrivateSecurityRealm(false)
instance.setSecurityRealm(hudsonRealm)
hudsonRealm.createAccount('admin','admin')

def strategy = new FullControlOnceLoggedInAuthorizationStrategy()
instance.setAuthorizationStrategy(strategy)
instance.setCrumbIssuer(null)

// if (!instance.installState.isSetupComplete()) {
//   println '--> Neutering SetupWizard'
//   InstallState.INITIAL_SETUP_COMPLETED.initializeState()
// }

instance.setInstallState(InstallState.INITIAL_SETUP_COMPLETED)

instance.save()