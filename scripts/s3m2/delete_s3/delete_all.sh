#!/bin/bash

set +x
set -e

echo "**** Main ****"
echo "ENV: $1"
echo "Type: $2"
echo "**************"
echo " "

sh delete_datadog.sh $1 $2
sh delete_secrets.sh $1 $2
sh delete_others.sh $1 $2	
sh delete_ssl.sh $1 $2
sh delete_plugins.sh $1 $2
sh delete_active.sh $1 $2
sh delete_launch.sh $1 $2
sh delete_delete.sh $1 $2