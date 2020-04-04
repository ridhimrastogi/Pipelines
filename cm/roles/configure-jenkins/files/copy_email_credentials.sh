#!/bin/bash

function subst() { eval echo -E "$2"; }

mapfile -c 1 -C subst < /var/lib/jenkins_templates/email.properties.template | sudo tee /var/lib/jenkins/workspace/iTrust/iTrust2/src/main/java/email.properties

sudo chmod 777 /var/lib/jenkins/workspace/iTrust/iTrust2/src/main/java/email.properties
