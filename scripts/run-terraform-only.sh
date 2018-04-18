#!/bin/bash

set +x
set -e

#export MASTER_IP=$1
#export JENKMDATE=$2
#
#
export Environment="Staging"
#export Environment="Production"
#export DRY_RUN=yes
#
# tool master
if ! [ -z "$TOOL" ];then
  export MATTENV=devops	
  export JENKINS_TYPE=toolm-stg
  export JENK_SEC_GRP_IDS='"sg-72067905","sg-9e7f00e9","sg-c492c5b2"'
  export JENKINS_MASTER_TYPE=""
  export JENK_KEY_NAME="devops-build-17"
  export JENK_SUBNET_ID="subnet-40c9f924"
  export USE_JENKINS_AMI="ami-ecd17591"
elif ! [ -z "$EQP" ];then
 export MATTENV=devops
 export JENKINS_TYPE=jenkm-eqp-test
 export JENK_SEC_GRP_IDS='"sg-269dd651","sg-769fd401","sg-b04e01c6"'
 export JENKINS_MASTER_TYPE="eqp"	
 export JENK_KEY_NAME="devops-build-17"
 export JENK_SUBNET_ID="subnet-4f2c112b"
 export USE_JENKINS_AMI="ami-ecd17591"
elif ! [ -z "$PACKER" ];then
 export MATTENV=devops
 export JENKINS_TYPE=jenkm-eqp-test
 export JENK_SEC_GRP_IDS='"sg-269dd651","sg-769fd401","sg-b04e01c6"'
 export JENKINS_MASTER_TYPE="eqp"	
 export JENK_KEY_NAME="devops-build-17"
 export JENK_SUBNET_ID="subnet-4f2c112b"
 export USE_JENKINS_AMI="ami-18373d62"

fi

export JENK_AMI=$USE_JENKINS_AMI
export JENKINS_DISK_SIZE=100

#export USE_JENKINS_AMI="ami-b2003ac8" 
#export USE_JENKINS_AMI="ami-22d30c5f"
#export USE_JENKINS_AMI="ami-9cbe67e1"
#
# eqp master

#
#export MATTENV=webdigital
#export JENK_SUBNET_NAME="WebDigital-Private-PL-1a"
##export JENKINS_TYPE="jenkins-mdc-fatext"
##export JENKINS_TYPE="jenkm-t-interface-ur"
#export JENKINS_TYPE="jenkm-t-fatext-pr"
#export JENK_KEY_NAME="saas-cicd2"
## add JENK_SEC_GRP_IDS
#export JENK_SEC_GRP_NAMES="Digital-private-Prod Digital-private-ALL digital-jenkins-access-cicd"
##export USE_JENKINS_AMI="ami-3c47da46"
#export USE_JENKINS_AMI="ami-04ad957e" #AMI v2 - kernel changes
#export JENKINS_DISK_SIZE=100
#
export JENKINS_BRANCH=""
#export Environment="Staging"
export Executors="0"
export JENK_INSTANCE_TYPE="m4.xlarge"
export JENK_VOL_TYPE="gp2"
export SKIPNODES="yes"
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
