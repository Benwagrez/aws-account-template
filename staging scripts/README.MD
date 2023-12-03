# Terraform Remote State Management Init Steps

This module was created to onboard an AWS account for use with Terraform remote state management using S3 and DynamoDB. Steps are also included illustrating how to setup the AWS account for use with Terraform Enterprise, Terraform Cloud, or local Terraform state management.

<!-- TOC -->

- [Terraform Remote State Management Init Steps](#Terraform-Remote-State-Management-Init-Steps)
  - [Remote State Using S3 and DynamoDB](#Remote-State-Using-S3-and-DynamoDB)
    - [Deployment Steps](#Deployment-Steps)
    - [Resources Created](#Resources-Created)
  - [Terraform Enterprise](#Terraform-Enterprise)
  - [Terraform Cloud](#Terraform-Cloud)
  - [Local State Management](#Local-State-Management)

<!-- /TOC -->

## Remote State Using S3 and DynamoDB

Remote state management using S3 and DynamoDB leverages S3 object store as the state store and DynamoDB as the state locking mechanism. The steps to deploy this configuration is detailed below.

### Deployment Steps

1. Use the following quick create link to deploy the CloudFormation template to deploy the resources defined in [Deployment Steps](#Deployment-Steps): \<INSERT LINK HERE\>
2.
3. Configure your Terraform provider backend accordingly:
...
#provider.tf

provider "aws" {
   region = \<Deploy-Region\>
 }

 terraform {
   backend "s3" {
     bucket = \<Remote-State-Bucket-Name\>
     key = \<Remote-State-File-Name\> # Specify the name of the tfstate file (e.g., example.tfstate)
     region = \<Remote-State-Region\>
     dynamodb_table = \<Remote-State-DynamoDB-Name\>
     encrypt = true # Leave as true, encryption is enforced by default in S3
   }
 }
 ...
 > **_NOTE:_**  For your ease, the values required in backend have been specified as outputs for the CloudFormation template. Refer to the deployment manifest to fill in the values required for the backend configuration.
4. Utilize AWS IAM user credentials for Terraform by integrating it with your current workflow. This can be by logging into the account so allow AWS CLI to manage the credential profile, or inputing the access key credentials via a tfvars file, or via integration as an environment secret in a pipeline. The access key credentials are stored in the AWS account's SSM store, refer to the CloudFormation outputs for its exact SSM uri.
5. Enter the command Terraform Plan to validate the backend configuration and access level

### Resources Created


## Terraform Enterprise

## Terraform Cloud

## Local State Management

## Module TODOs

- [ ] Cloudformation script that deploys Terraform SPN and S3 with DyanmoDB for state locking, outputs the necessary vars to ready Terraform workflow
- [ ] Create a step by step instruction plan for creating AWS account, launching above cloudformation script, set up terraform workflow and deploy main organization shit
- [ ] HArden the S3 bucket to prevent deletion and scope access to SPN
- [ ] Look into creating one click deployment
