#!/bin/bash

set +x
set -e

S3LOCATION="s3://magento-digital-cicdrepo/private/jenkins/datadog"
LOCLOCATION="/Users/mpodber/files/jenkins-auto/datadog"

AWS_PROFILE=webdigital aws s3 cp $S3LOCATION/api_jenk_executors_busy.py $LOCLOCATION/api_jenk_executors_busy.py
AWS_PROFILE=webdigital aws s3 cp $S3LOCATION/api_jenk_queue.py $LOCLOCATION/api_jenk_queue.py
AWS_PROFILE=webdigital aws s3 cp $S3LOCATION/jenk_executors_busy.py $LOCLOCATION/jenk_executors_busy.py
AWS_PROFILE=webdigital aws s3 cp $S3LOCATION/jenk_executors_busy.yaml $LOCLOCATION/jenk_executors_busy.yaml
