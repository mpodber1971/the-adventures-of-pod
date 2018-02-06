#!/bin/bash

set +x
set -e

echo "ENV: $1"
echo "Type: $2"

sh upload_datadog.sh $1 $2
sh upload_secrets.sh $1 $2
sh upload_others.sh $1 $2	
sh upload_ssl.sh $1 $2
sh upload_plugins.sh $1 $2