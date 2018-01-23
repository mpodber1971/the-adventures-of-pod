#!/bin/bash

set +x
set +e

echo $1

ssh centos@$1 -i ~/.ssh/DevTools.pem 'stat /var/log/wtmp' | grep -v "(" | grep -v "File" | grep -v "Device" | grep -v "Size" | grep -v "Birth"
retval=$?

if ! [ "$retval" == 0 ];then
  ssh stack@$1 'stat /var/log/wtmp' | grep -v "(" | grep -v "File" | grep -v "Device" | grep -v "Size" | grep -v "Birth"
  second_retval=$?

  if ! [ "$second_retval" == 0 ];then
  	echo "NO SSH ACCESS" > ~/logs/no_ssh_access/$1_$3_$2
  else
  	echo "Stack SSH" > ~/logs/ssh_access/$1_$3_$2_stack
  fi
else
  echo "CENTOS SSH" > ~/logs/ssh_access/$1_$3_$2_centos
fi

  
