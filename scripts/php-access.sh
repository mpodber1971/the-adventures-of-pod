#!/bin/bash

set +x

echo "ip: $1"
echo "dir: $4"

chk_ping=$(ping -n -c 2 $1 | grep "Request timeout" | wc -l)

if [ $chk_ping -gt 0 ];then
  echo "$1 not available, skipping..."
  exit
fi

ssh centos@$1 -i ~/.ssh/DevTools.pem 'php --version | grep PHP | grep cli | wc -l'
retval=$?

if [ $retval -eq 255 ];then
  ssh stack@$1 -i ~/.ssh/DevTools.pem 'php --version | grep PHP | grep cli | wc -l'
  second_retval=$?

  if ! [ $second_retval -eq 255 ];then
  	MYPHP=$(ssh stack@$1 -i ~/.ssh/DevTools.pem 'php --version | grep PHP | grep cli | wc -l')
    echo "access via stack"
    if ! [ $MYPHP -eq 0 ];then
  	  MYPHPOUT=$(ssh stack@$1 -i ~/.ssh/DevTools.pem 'php --version | grep PHP | grep cli ')
  	  echo "$MYPHPOUT" > ~/logs/$4/centos/$1_$2
  	fi
  else
    ssh stack@$1 'php --version | grep PHP | grep cli'
    third_retval=$?  	

    if ! [ $third_retval -eq 255 ];then
  	  MYPHP=$(ssh stack@$1 'php --version | grep PHP | grep cli | wc -l')
  	  echo "access via id_rsa"
  	  if ! [ $MYPHP -eq 0 ];then
  	    MYPHPOUT=$(ssh stack@$1 'php --version | grep PHP | grep cli ')
  	    echo "$MYPHPOUT" > ~/logs/$4/ubuntu/$1_$2
  	  fi
  	fi
  fi
else
  MYPHP=$(ssh centos@$1 -i ~/.ssh/DevTools.pem 'php --version | grep PHP | grep cli | wc -l')
  echo "access via centos"
  if ! [ $MYPHP -eq 0 ];then
  	  MYPHPOUT=$(ssh centos@$1 -i ~/.ssh/DevTools.pem 'php --version | grep PHP | grep cli ')
  	  echo "$MYPHPOUT" > ~/logs/$4/centos/$1_$2
  fi
fi

  
