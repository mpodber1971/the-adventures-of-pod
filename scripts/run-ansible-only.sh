#!/bin/bash

set +x
set -e

export MASTER_IP="$1"
#export MATTPASS="$2"
#
export Environment="Staging"

#

if ! [ -z "$TOOL" ];then
  export MATTENV=devops
  export JENKINS_TYPE=toolm-stg
  export JENK_KEY_NAME="devops-build-17"
  export JENK_SUBNET_ID="subnet-40c9f924"
  export Service="jenkins-tool-stg"
  export JENKINS_S3_HOME_DIR="s3://toolm-artifacts-stage"
  export JENK_AMI="ami-ecd17591"
  export JENKB_SUBNET_AZ_END="a"
elif ! [ -z "$EQP" ];then
  export MATTENV=devops
  export JENKINS_TYPE=jenkm-eqp-test
  export JENK_KEY_NAME="devops-build-17"
  export JENK_SUBNET_ID="subnet-4f2c112b"
  export Service="jenkins-eqp-test-stg"
  export JENKINS_S3_HOME_DIR="s3://toolm-eqp-artifacts-stage"
  export JENK_AMI="ami-ecd17591"
  export JENKB_SUBNET_AZ_END="a"
fi


#
export JENKINS_BRANCH=""
export Executors="0"
export JENK_INSTANCE_TYPE="m4.xlarge"
export JENK_VOL_TYPE="gp2"
export SKIPNODES="no"
export TEST_NODES="no"
export TOTAL_TEST_NODES="4"
export thebranch=$(git branch | grep '*' |  awk '{print $2}')
#
export UPDATE_JENKINS_HOSTNAME=yes
export STARTING_NODE_AZ='a'
export CLEAR_JOBS=no
export FULL_PROCESS=no
export TERRAFORM_ONLY=no
export LOCALLOGNAME="matt.log"

cd jenkins-master/terraform
rm terraform.tfstate || true
rm jenkins.tfvars || true
cd -
cd jenkins-master/ansible
AWS_PROFILE=$MATTENV sh jenkins-master.sh
cd -
