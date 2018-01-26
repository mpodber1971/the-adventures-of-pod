#!/bin/bash

set +x
set -e

UPLOADLOCATION="s3://jenkins-automation-artifacts-Int-eqp/secrets"
LOCALLOCATION="/Users/mpodber/files/jenkins-auto/secrets"

THEPROFILE=devops

AWS_PROFILE=$THEPROFILE aws s3 cp $LOCALLOCATION/hudson.util.Secret $UPLOADLOCATION/
AWS_PROFILE=$THEPROFILE aws s3 cp $LOCALLOCATION/master.key $UPLOADLOCATION/
