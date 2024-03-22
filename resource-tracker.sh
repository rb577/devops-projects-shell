#!/usr/bin/bash
####################
#
#
####################
#
echo " list s3 buckets"
aws s3 ls>>resourcetracker.txt

echo " list ec2 instances"
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId'>>resourcetracker.txt

echo "list IAM groups"
aws iam list-groups | jq '.Groups[]' >> resourcetracker.txt

echo "list lambda functions"
aws lambda list-functions | jq '.Functions[]' >> resourcetracker.txt

