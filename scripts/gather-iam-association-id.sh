#!/bin/bash

set +x
set -e

AWS_PROFILE=webdigital aws ec2 describe-iam-instance-profile-associations --filters Name=instance-id,Values=$1 --query IamInstanceProfileAssociations[*].[AssociationId,InstanceId] --output text

IID=$(AWS_PROFILE=webdigital aws ec2 describe-iam-instance-profile-associations --filters Name=instance-id,Values=$1 --query IamInstanceProfileAssociations[*].AssociationId --output text)

echo $IID
#AWS_PROFILE=webdigital aws ec2 disassociate-iam-instance-profile --association-id $IID