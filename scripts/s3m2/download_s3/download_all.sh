#!/bin/bash

set +x
set -e

sh download_datadog.sh	
sh download_secrets.sh
sh download_others.sh	
sh download_ssl.sh
sh download_plugins.sh