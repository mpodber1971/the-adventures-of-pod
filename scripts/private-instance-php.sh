#!/bin/bash

set +x
set +e

echo $3

sh php-access.sh $3 $2 $1 private_php_patch