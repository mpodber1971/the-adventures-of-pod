#!/bin/bash

# how to run
# new instance: 
#  AUTORUN=yes JMASTER=interface JMODE=ur JENV=stg LATESTPLUGINS=yes TEST_NODES=yes sh run_auto.sh 
#  AUTORUN=yes JMASTER=interface JMODE=ur JENV=stg LATESTPLUGINS=yes TEST_NODES=yes sh SKIPNODES=yes run_auto.sh 
# OR
# selecting Jenkins branch:
#  AUTORUN=yes JENKINS_TYPE=jenkm-t-fatext-pr LATESTPLUGINS=yes TEST_NODES=yes sh run_auto.sh
#  AUTORUN=yes JENKINS_TYPE=jenkm-t-fatext-pr LATESTPLUGINS=yes TEST_NODES=yes JENKINS_BRANCH="podber/devops-1241-select-branch" sh run_auto.sh
#  AUTORUN=yes JENKINS_TYPE=jenkm-t-fatext-pr LATESTPLUGINS=yes TEST_NODES=yes SKIPNODES=yes USE_JENKINS_AMI=ami-file-name sh run_auto.sh
# existing instance:
#  sh run_auto.sh IP_ADDRESS
#
# you can add TEST_NODES=yes in front if you want to launch small set of jenkins nodes



if ! [ -z "$1" ];then
  export MASTER_IP=$1
  echo "MASTER ip: $MASTER_IP"
fi
#
export MATTENV=devops
export JENKINS_TYPE=toolm-x-x-int
export JENK_SUBNET_NAME="DevOps-Svc-Int-Private-us-east-1c"
export JENK_KEY_NAME="devops-build-17"
export JENK_SEC_GRP_NAMES="DevOps-Svc-Int-Office-SSH-Access-sg DevOps-Svc-Int-Office-HTTP-Access-sg DevOps-Svc-Int-webdigital-access-sg DevOps-Svc-Int-eqp-access-sg DevOps-Svc-Int-jenkins-tool-master-sg"
#export USE_JENKINS_AMI="ami-985b31e2" #AMI v1
export USE_JENKINS_AMI="ami-b2003ac8" #AMI v2 - kernel changes
export JENKS_AMI="ami-cf693eb5"
#
#export Stage="Team"
export Executors=0
export CLEAR_JOBS="no"
export JENK_SUBNET_NAME="Digital-1a-Private-PL"
export JENK_AMI="ami-edae46fb"
export JENK_INSTANCE_TYPE="t2.large"
export JENK_IAM_PROFILE="Digital-s3-multi-account-full"
export JENK_KEY_NAME="saas-cicd2"
#export JENK_PROJECT="pipeline"
export JENK_SEC_GRP_NAMES="Digital-private-Prod Digital-private-ALL digital-jenkins-access-cicd"
export JENK_VOL_TYPE="gp2"
# update as needed
#export LOCALLOG="yes"
export LOCALLOGNAME="matt.log"
export STARTING_NODE_AZ="b"
export BUILD_USER_ID=$USER

export thebranch=$(git branch | grep '*' |  awk '{print $2}')
echo "Git branch: $thebranch"

export SKIPNODES=yes
export UPDATE_JENKINS_HOSTNAME="yes"

cd terraform
rm terraform.tfstate || true
rm jenkins.tfvars || true
cd -
AWS_PROFILE=$MATTENV sh jenkins_automation.sh

