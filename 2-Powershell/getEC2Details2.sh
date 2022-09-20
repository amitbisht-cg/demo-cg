#!/bin/bash

## Usage: ./getEC2Details2.sh i-0a2f7fe119179ff69 SubnetId

## Authenticating to AWS Account
export AWS_ACCESS_KEY_ID=##########
export AWS_SECRET_ACCESS_KEY=##########
export AWS_DEFAULT_OUTPUT="json"
## Check if CMD arguments are supplied
if [ -z "$1" ]
then
        echo "Provide EC2 Instance ID along with script to proceed"
        exit
elif [ -z "$2" ]
then
        echo "Provide specific data key to be retrieved for EC2 instance"
        exit
else
        aws ec2 describe-instances --instance-id $1 --query "Reservations[*].Instances[*].$2" --output text
fi