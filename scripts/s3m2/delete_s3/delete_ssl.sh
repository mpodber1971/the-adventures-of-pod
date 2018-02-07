#!/bin/bash

set +x
set -e

echo "ENV: $1"
echo "Type: $2"

THEPROFILE=devops

UPLOADLOCATION="s3://jenkins-automation-artifacts-$1-$2/ssl/"

echo "Upload Location: $UPLOADLOCATION"

S3_FILES=$(AWS_PROFILE=devops aws s3 ls $UPLOADLOCATION | grep -v PRE | awk '{print $4}')

for S3F in $S3_FILES 
do
 AWS_PROFILE=$THEPROFILE aws s3 rm $UPLOADLOCATION$S3F
done
