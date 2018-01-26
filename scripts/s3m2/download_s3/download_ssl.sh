#!/bin/bash

set +x
set -e

S3LOCATION="s3://magento-digital-cicdrepo/private/jenkins/ssl"
LOCLOCATION="/Users/mpodber/files/jenkins-auto/ssl"

AWS_PROFILE=webdigital aws s3 cp $S3LOCATION/DigiCertCA.cer $LOCLOCATION/DigiCertCA.cer
AWS_PROFILE=webdigital aws s3 cp $S3LOCATION/star.devops.magento.com.cer $LOCLOCATION/star.devops.magento.com.cer
AWS_PROFILE=webdigital aws s3 cp $S3LOCATION/star.devops.magento.com.key $LOCLOCATION/star.devops.magento.com.key