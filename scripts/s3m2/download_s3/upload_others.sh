#!/bin/bash

set +x
set -e

THEPROFILE=devops

UPLOADLOCATION="s3://jenkins-automation-artifacts-Int-eqp"
LOCALLOCATION="/Users/mpodber/files/jenkins-auto"

AWS_PROFILE=$THEPROFILE aws s3 cp $LOCALLOCATION/org.jenkinsci.plugins.ParameterizedRemoteTrigger.RemoteBuildConfiguration.xml $UPLOADLOCATION/org.jenkinsci.plugins.ParameterizedRemoteTrigger.RemoteBuildConfiguration.xml
AWS_PROFILE=$THEPROFILE aws s3 cp $LOCALLOCATION/org.thoughtslive.jenkins.plugins.jira.Config.xml $UPLOADLOCATION/org.thoughtslive.jenkins.plugins.jira.Config.xml
AWS_PROFILE=$THEPROFILE aws s3 cp $LOCALLOCATION/docker-credential-ecr-login $UPLOADLOCATION/docker-credential-ecr-login
