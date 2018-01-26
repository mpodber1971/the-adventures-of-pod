#!/bin/bash

set +x
set -e

export MASTER_IP="$1"
#
export Environment="Staging"
#
export MATTENV=devops
export JENKINS_TYPE=toolm-x-x-int
export JENK_SUBNET_NAME="DevOps-Svc-Int-Private-us-east-1c"
export JENK_KEY_NAME="devops-build-17"
export JENK_SEC_GRP_NAMES="DevOps-Svc-Int-Office-SSH-Access-sg DevOps-Svc-Int-Office-HTTP-Access-sg DevOps-Svc-Int-webdigital-access-sg DevOps-Svc-Int-eqp-access-sg DevOps-Svc-Int-jenkins-tool-master-sg"
export USE_JENKINS_AMI="ami-985b31e2"
export JENKS_AMI="ami-cf693eb5"
export Service="jenkins-tool-int"
export JENKINS_S3_HOME_DIR="s3://jenkins-automation-artifacts-Int-eqp"
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
