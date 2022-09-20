## Usage: ./getEC2Instance.ps1 "i-0a2f7fe119179ff69"
param (
	[Parameter(Mandatory=$true)][string]$instanceID
)

#Setting AWS Credentials
$Region = "us-east-1"
$ACCESS_KEY = "######"
$SECRET_KEY = "#########"

#Set the AWS Credentials
Set-AWSCredential -AccessKey $ACCESS_KEY -SecretKey $SECRET_KEY -StoreAs demoAWSProfile
$AWSCredentials = Get-AWSCredential "demoAWSProfile"
#Get the EC2 Instance Details
$instance = (Get-EC2Instance -Credential $AWSCredentials -InstanceID $instanceID -Region $Region).Instances | ConvertTo-Json
Write-Host $instance