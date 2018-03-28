#!/bin/bash

set +x
set -e

echo "bucket: $1"

THEPROFILE=devops

UPLOADLOCATION="s3://$1/datadog"
LOCALLOCATION="/Users/mpodber/files/jenkins-auto/datadog"

echo "Upload Location: $UPLOADLOCATION"

AWS_PROFILE=$THEPROFILE aws s3 cp $LOCALLOCATION/api_jenk_executors_busy.py $UPLOADLOCATION/api_jenk_executors_busy.py
AWS_PROFILE=$THEPROFILE aws s3 cp $LOCALLOCATION/api_jenk_queue.py $UPLOADLOCATION/api_jenk_queue.py
AWS_PROFILE=$THEPROFILE aws s3 cp $LOCALLOCATION/jenk_executors_busy.py $UPLOADLOCATION/jenk_executors_busy.py
AWS_PROFILE=$THEPROFILE aws s3 cp $LOCALLOCATION/jenk_executors_busy.yaml $UPLOADLOCATION/jenk_executors_busy.yaml
AWS_PROFILE=$THEPROFILE aws s3 cp $LOCALLOCATION/jenk_queue.py $UPLOADLOCATION/
AWS_PROFILE=$THEPROFILE aws s3 cp $LOCALLOCATION/jenk_queue.yaml $UPLOADLOCATION/