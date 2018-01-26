#!/bin/bash

set +x
set -e

S3LOCATION="s3://magento-digital-cicdrepo/private/jenkins/secrets"
LOCLOCATION="/Users/mpodber/files/jenkins-auto/secrets"

AWS_PROFILE=webdigital aws s3 cp $S3LOCATION/hudson.util.Secret $LOCLOCATION/hudson.util.Secret
AWS_PROFILE=webdigital aws s3 cp $S3LOCATION/master.key $LOCLOCATION/master.key
