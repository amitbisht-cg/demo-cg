#!/bin/bash

## Usage: ./getEC2Details2.sh i-0a2f7fe119179ff69

## Authenticating to AWS Account
export AWS_ACCESS_KEY_ID=##########
export AWS_SECRET_ACCESS_KEY=##########

## Check if CMD argument is supplied
if [ -z "$1" ]
then
        echo "Provide EC2 Instance ID along with script to proceed"
        exit
else
        aws ec2 describe-instances --instance-id $1 --output json
fi
