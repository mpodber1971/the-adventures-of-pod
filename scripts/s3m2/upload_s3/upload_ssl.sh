#!/bin/bash

set +x
set -e

echo "bucket: $1"

UPLOADLOCATION="s3://$1/ssl"
LOCALLOCATION="/Users/mpodber/files/jenkins-auto/ssl"

echo "Upload Location: $UPLOADLOCATION"

THEPROFILE=devops

AWS_PROFILE=$THEPROFILE aws s3 cp $LOCALLOCATION/DigiCertCA.cer $UPLOADLOCATION/
AWS_PROFILE=$THEPROFILE aws s3 cp $LOCALLOCATION/star.devops.magento.com.cer $UPLOADLOCATION/
AWS_PROFILE=$THEPROFILE aws s3 cp $LOCALLOCATION/star.devops.magento.com.key $UPLOADLOCATION/
