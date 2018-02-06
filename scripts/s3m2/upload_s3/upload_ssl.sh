#!/bin/bash

set +x
set -e

echo "ENV: $1"
echo "Type: $2"

UPLOADLOCATION="s3://jenkins-automation-artifacts-$1-$2/ssl"
LOCALLOCATION="/Users/mpodber/files/jenkins-auto/ssl"

echo "Upload Location: $UPLOADLOCATION"

THEPROFILE=devops

AWS_PROFILE=$THEPROFILE aws s3 cp $LOCALLOCATION/DigiCertCA.cer $UPLOADLOCATION/
AWS_PROFILE=$THEPROFILE aws s3 cp $LOCALLOCATION/star.devops.magento.com.cer $UPLOADLOCATION/
AWS_PROFILE=$THEPROFILE aws s3 cp $LOCALLOCATION/star.devops.magento.com.key $UPLOADLOCATION/
