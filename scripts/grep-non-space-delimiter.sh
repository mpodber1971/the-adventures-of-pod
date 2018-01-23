#!/bin/bash

set +x
set -e

AWS_PROFILE=webdigital python aws-private-non-m2-instances.py | grep Digital-Developers-Role | awk -F  "|" '/1/ {print $4}'

AWS_PROFILE=webdigital python aws-private-non-m2-instances.py | grep Digital-Private-Prod-Role | awk -F  "|" '/1/ {print "sh remove-iam-association-id.sh " $4 " " $3 " " $5}'

AWS_PROFILE=webdigital python aws-private-non-m2-instances.py | grep stopped | awk -F  "|" '/1/ {print $4 " " $3 " " $5}'

AWS_PROFILE=webdigital python aws-private-non-m2-instances.py | grep running | awk -F  "|" '/1/ {print "sh instance-access.sh " $5 " " $3 " " $4}'