#!/bin/bash

set +x
set -e

echo "ENV: $1"
echo "Type: $2"

THEPROFILE=devops

UPLOADLOCATION="s3://jenkins-automation-artifacts-$1-$2"
LOCALLOCATION="/Users/mpodber/files/jenkins-auto"

echo "Upload Location: $UPLOADLOCATION"

AWS_PROFILE=$THEPROFILE aws s3 cp $LOCALLOCATION/org.jenkinsci.plugins.ParameterizedRemoteTrigger.RemoteBuildConfiguration.xml $UPLOADLOCATION/org.jenkinsci.plugins.ParameterizedRemoteTrigger.RemoteBuildConfiguration.xml
AWS_PROFILE=$THEPROFILE aws s3 cp $LOCALLOCATION/org.thoughtslive.jenkins.plugins.jira.Config.xml $UPLOADLOCATION/org.thoughtslive.jenkins.plugins.jira.Config.xml
AWS_PROFILE=$THEPROFILE aws s3 cp $LOCALLOCATION/docker-credential-ecr-login $UPLOADLOCATION/docker-credential-ecr-login
AWS_PROFILE=$THEPROFILE aws s3 cp $LOCALLOCATION/jenkins.model.JenkinsLocationConfiguration.xml $UPLOADLOCATION/