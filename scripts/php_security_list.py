#!/usr/bin/env python2.7

'''
php_security_list.py: goes thru provided file and gathers instance name and status and creates new output file

how to run:
AWS_PROFILE=webdigital python php_security_list.py -f "/Users/mpodber/Downloads/security_2018_03_13_09_06.csv" -o "/Users/mpodber/files/php_security.csv"

'''

from boto.ec2.connection import EC2Connection
import boto
from time import *
from datetime import *
import logging
import sys
import os
import smtplib
import base64
import argparse
import operator
from shutil import copyfile

__author__="mpodber"

parser = argparse.ArgumentParser(description='Produce a csv file based on current running instances in AWS')
parser.add_argument('-u', '--user', action='store', help='User Account Name')
parser.add_argument('-f', '--filename', action='store', help='file name')
parser.add_argument('-o', '--outfile', action='store', help='output file name')

args = parser.parse_args()

# aws keys are located in /etc/boto.cfg

now = strftime("%Y-%m-%d-%H-%M", localtime())

security_file_name = args.filename

conn = EC2Connection()

f = open(args.outfile,'w+')
print "Output file: %s" % (args.outfile)

print ""

with open(security_file_name) as lx:
    for line in lx:
      (name, version, resourceid) = line.rstrip('\n').lower().split(',')
      name = name.replace('"','')
      version = version.replace('"','')
      resourceid = resourceid.replace('"','')

      if resourceid[0:2] == 'i-':
 
      	instance = conn.get_only_instances(filters={'instance-id': resourceid} )

      	if 'Name' in instance[0].tags:
      		instance_name = instance[0].tags['Name']

      		instance_state = instance[0].state
      		print "%s %s %s %s %s" % (instance_name, resourceid, name,version, instance_state)
      		f.write(instance_name.encode('utf-8'))
      		f.write(","+resourceid+","+name+","+version+","+instance_state+"\n")

if args.outfile:
	f.close()