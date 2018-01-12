#!/usr/bin/env python2.7
#
# aws-instances-inbound-public.py
#
# this will return all instances with public inbound access
#
# i.e. AWS_PROFILE=webdigital python aws-instances-inbound-public.py
#

from boto.ec2.connection import EC2Connection
import boto
from boto.vpc import VPCConnection
from time import *
from datetime import *
import logging
import sys
import os
import smtplib
import base64
import argparse
import operator
from pprint import pprint

__author__="mpodber"

parser = argparse.ArgumentParser(description='Start, Stop or Reboot an AWS instance')
parser.add_argument('-n', '--name',action='store', help='find by Instance Name')

args = parser.parse_args()

#public_subnet_dict = ['jenks','jenkb','seln','jenkm','bam::','bamboo','selh','useast','web-','datapipe','toolm']

public_file_list = "public_subnets.list"

public_dict = {}
instance_profile = {}

#with open(public_file_list) as pub_list:
#    for line in pub_list:
#      (subnet_name,subnet_id) = line.rstrip('\n').lower().split(' ')
#      public_dict[subnet_id]=subnet_name

conn = EC2Connection()
vpc = VPCConnection()

vpc_subnets = vpc.get_all_subnets()

for vpcsub in vpc_subnets:
	if 'Name' in vpcsub.tags:
		if vpcsub.tags['Name'].lower().find("public") != -1:
#			print "%s" % vpcsub.tags['Name']
			public_dict[vpcsub.id]=vpcsub.tags['Name']

ec2inst = conn.get_only_instances()

total_instances = 0
total_public_instances = 0

print "||Name||Instance Id||IP Address||State||Subnet Id||Subnet Name||Instance Profile||"
for instance in ec2inst:

	total_instances += 1

	if 'Name' in instance.tags:
		use_name = instance.tags['Name']
	else:
		use_name = instance.id

	if instance.instance_profile is None:
		use_arn = " "
	else:
		if 'arn' in instance.instance_profile:
			use_arn = instance.instance_profile['arn']
		else:
			use_arn = " "

	iFound = False
	if instance.subnet_id in public_dict:
		iFound = True
	elif instance.ip_address is not None:
		iFound = True

	if iFound:
		if len(use_arn) > 1:
			if use_arn in instance_profile:
				instance_profile[use_arn] += 1
			else:
				instance_profile[use_arn] = 1

		vpc_subnet_names = vpc.get_all_subnets(filters={'subnet_id': instance.subnet_id})

		for vpc_name in vpc_subnet_names:
			subnet_name = vpc_name.tags['Name']

		total_public_instances += 1
		print "|%s|%s|%s|%s|%s|%s|%s|" % (use_name,instance.id,instance.private_ip_address,instance.state,instance.subnet_id,subnet_name,use_arn)


print "\nTotal instances: %d" % total_instances
print "Total public instances: %d\n" % total_public_instances

for key, value in instance_profile.iteritems():
	print "%s : %d" % (key,value)

exit(0)