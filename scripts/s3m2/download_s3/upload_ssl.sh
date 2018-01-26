#!/bin/bash

set +x
set -e

UPLOADLOCATION="s3://jenkins-automation-artifacts-Int-eqp/ssl"
LOCALLOCATION="/Users/mpodber/files/jenkins-auto/ssl"

THEPROFILE=devops

AWS_PROFILE=$THEPROFILE aws s3 cp $LOCALLOCATION/DigiCertCA.cer $UPLOADLOCATION/
AWS_PROFILE=$THEPROFILE aws s3 cp $LOCALLOCATION/star.devops.magento.com.cer $UPLOADLOCATION/
AWS_PROFILE=$THEPROFILE aws s3 cp $LOCALLOCATION/star.devops.magento.com.key $UPLOADLOCATION/
