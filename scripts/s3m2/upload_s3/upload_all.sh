#!/bin/bash

set +x
set -e

sh upload_datadog.sh	
sh upload_secrets.sh
sh upload_others.sh	
sh upload_ssl.sh
sh upload_plugins.sh