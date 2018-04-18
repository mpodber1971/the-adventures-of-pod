#!/bin/bash

set +x
set -e

S3LOCATION="s3://magento-digital-cicdrepo/private/jenkins/plugins"
LOCLOCATION="/Users/mpodber/files/jenkins-auto/plugins"

AWS_PROFILE=webdigital aws s3 cp $S3LOCATION/workflow-cps.jpi $LOCLOCATION/
AWS_PROFILE=webdigital aws s3 cp $S3LOCATION/workflow-cps-global-lib.jpi $LOCLOCATION/
AWS_PROFILE=webdigital aws s3 cp $S3LOCATION/workflow-aggregator.jpi $LOCLOCATION/
AWS_PROFILE=webdigital aws s3 cp $S3LOCATION/uno-choice.hpi $LOCLOCATION/
AWS_PROFILE=webdigital aws s3 cp $S3LOCATION/scriptler.jpi $LOCLOCATION/
AWS_PROFILE=webdigital aws s3 cp $S3LOCATION/pipeline-stage-view.jpi $LOCLOCATION/
AWS_PROFILE=webdigital aws s3 cp $S3LOCATION/pipeline-build-step.jpi $LOCLOCATION/
AWS_PROFILE=webdigital aws s3 cp $S3LOCATION/nodelabelparameter.jpi $LOCLOCATION/
AWS_PROFILE=webdigital aws s3 cp $S3LOCATION/jira-steps.hpi $LOCLOCATION/
AWS_PROFILE=webdigital aws s3 cp $S3LOCATION/http_request.jpi $LOCLOCATION/
AWS_PROFILE=webdigital aws s3 cp $S3LOCATION/greenballs.jpi $LOCLOCATION/
AWS_PROFILE=webdigital aws s3 cp $S3LOCATION/git.jpi $LOCLOCATION/
AWS_PROFILE=webdigital aws s3 cp $S3LOCATION/extended-choice-parameter.jpi $LOCLOCATION/
AWS_PROFILE=webdigital aws s3 cp $S3LOCATION/envinject.jpi $LOCLOCATION/
AWS_PROFILE=webdigital aws s3 cp $S3LOCATION/ec2.jpi $LOCLOCATION/
AWS_PROFILE=webdigital aws s3 cp $S3LOCATION/ec2.hpi $LOCLOCATION/
AWS_PROFILE=webdigital aws s3 cp $S3LOCATION/ec2-2.89.4-1.1.hpi $LOCLOCATION/ 
AWS_PROFILE=webdigital aws s3 cp $S3LOCATION/dynamicparameter.jpi $LOCLOCATION/
AWS_PROFILE=webdigital aws s3 cp $S3LOCATION/dynamic-axis.jpi $LOCLOCATION/
AWS_PROFILE=webdigital aws s3 cp $S3LOCATION/docker-commons.jpi $LOCLOCATION/
AWS_PROFILE=webdigital aws s3 cp $S3LOCATION/docker-build-step.jpi $LOCLOCATION/
AWS_PROFILE=webdigital aws s3 cp $S3LOCATION/Parameterized-Remote-Trigger.hpi $LOCLOCATION/
