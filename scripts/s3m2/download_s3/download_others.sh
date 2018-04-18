#!/bin/bash

set +x
set -e

S3LOCATION="s3://magento-digital-cicdrepo/private/jenkins"
LOCLOCATION="/Users/mpodber/files/jenkins-auto"

AWS_PROFILE=webdigital aws s3 cp $S3LOCATION/org.jenkinsci.plugins.ParameterizedRemoteTrigger.RemoteBuildConfiguration.xml $LOCLOCATION/org.jenkinsci.plugins.ParameterizedRemoteTrigger.RemoteBuildConfiguration.xml
AWS_PROFILE=webdigital aws s3 cp $S3LOCATION/org.thoughtslive.jenkins.plugins.jira.Config.xml $LOCLOCATION/org.thoughtslive.jenkins.plugins.jira.Config.xml
AWS_PROFILE=webdigital aws s3 cp $S3LOCATION/docker-credential-ecr-login $LOCLOCATION/docker-credential-ecr-login
AWS_PROFILE=webdigital aws s3 cp $S3LOCATION/jenkins.model.JenkinsLocationConfiguration.xml $LOCLOCATION/
AWS_PROFILE=webdigital aws s3 cp $S3LOCATION/jdk-8u162-linux-x64.rpm $LOCLOCATION/
