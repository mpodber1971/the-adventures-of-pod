#!/bin/bash

set +x
set -e

echo "bucket: $1"

UPLOADLOCATION="s3://$1/secrets"
LOCALLOCATION="/Users/mpodber/files/jenkins-auto/secrets"

echo "Upload Location: $UPLOADLOCATION"

THEPROFILE=devops

AWS_PROFILE=$THEPROFILE aws s3 cp $LOCALLOCATION/hudson.util.Secret $UPLOADLOCATION/
AWS_PROFILE=$THEPROFILE aws s3 cp $LOCALLOCATION/master.key $UPLOADLOCATION/
