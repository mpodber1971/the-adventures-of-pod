#!/bin/bash

set +x
set -e

AWS_PROFILE=webdigital aws ec2 describe-iam-instance-profile-associations --filters Name=instance-id,Values=$1 --query IamInstanceProfileAssociations[*].[AssociationId,InstanceId] --output text

IID=$(AWS_PROFILE=webdigital aws ec2 describe-iam-instance-profile-associations --filters Name=instance-id,Values=$1 --query IamInstanceProfileAssociations[*].AssociationId --output text)

if [ -z "$IID" ];then
  echo "Instance Profile not found, exiting...."
  exit 1
fi

AWS_PROFILE=webdigital aws ec2 disassociate-iam-instance-profile --association-id $IID