#!/bin/bash

set +x
set +e

echo $1

ssh centos@$1 -i ~/.ssh/DevTools.pem 'php --version | grep PHP | grep cli'
retval=$?

if ! [ "$retval" == 0 ];then
  ssh stack@$1 -i ~/.ssh/DevTools.pem 'php --version | grep PHP | grep cli'
  second_retval=$?

  if [ "$second_retval" == 0 ];then
  	MYPHP=$(ssh stack@$1 -i ~/.ssh/DevTools.pem 'php --version | grep PHP | grep cli')
  	echo "$MYPHP" > ~/logs/php_patch/$1_$3_$2
  fi
else
  MYPHP=$(ssh centos@$1 -i ~/.ssh/DevTools.pem 'php --version | grep PHP | grep cli')
  echo "$MYPHP" > ~/logs/php_patch/$1_$3_$2
fi

  
