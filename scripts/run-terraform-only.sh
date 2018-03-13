#!/bin/bash

set +x
set -e

#export MASTER_IP=$1
#export JENKMDATE=$2
#
#
#export Environment="Staging"
export Environment="Production"
#export DRY_RUN=yes
#
#export MATTENV=devops
#export JENKINS_TYPE=toolm-x-x-int
#export JENK_SUBNET_NAME="DevOps-Svc-Int-Private-us-east-1c"
#export JENK_KEY_NAME="devops-build-17"
#export JENK_SEC_GRP_NAMES="DevOps-Svc-Int-Office-SSH-Access-sg DevOps-Svc-Int-Office-HTTP-Access-sg DevOps-Svc-Int-webdigital-access-sg DevOps-Svc-Int-eqp-access-sg DevOps-Svc-Int-jenkins-tool-master-sg"
##export USE_JENKINS_AMI="ami-985b31e2" #AMI v1
#export USE_JENKINS_AMI="ami-04ad957e" #AMI v2 - kernel changes
#export JENKS_AMI="ami-cf693eb5"

#
export MATTENV=webdigital
export JENK_SUBNET_NAME="WebDigital-Private-PL-1a"
#export JENKINS_TYPE="jenkins-mdc-fatext"
#export JENKINS_TYPE="jenkm-t-interface-ur"
export JENKINS_TYPE="jenkm-t-fatext-pr"
export JENK_KEY_NAME="saas-cicd2"
export JENK_SEC_GRP_NAMES="Digital-private-Prod Digital-private-ALL digital-jenkins-access-cicd"
#export USE_JENKINS_AMI="ami-3c47da46"
export USE_JENKINS_AMI="ami-04ad957e" #AMI v2 - kernel changes
export JENKINS_DISK_SIZE=100
#
export JENKINS_BRANCH=""
#export Environment="Staging"
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
export TERRAFORM_ONLY=yes
#export Service="jenkins-tool-int"



cd jenkins-master/terraform
rm terraform.tfstate || true
rm jenkins.tfvars || true
cd -
cd jenkins-master
AWS_PROFILE=$MATTENV sh jenkins_automation.sh
cd -
