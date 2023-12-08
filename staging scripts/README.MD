# Terraform Remote State Management Init Steps

This module was created to onboard an AWS account for use with Terraform remote state management using S3 and DynamoDB. Steps are also included illustrating how to setup the AWS account for use local Terraform state management.

<!-- TOC -->

- [Terraform Remote State Management Init Steps](#Terraform-Remote-State-Management-Init-Steps)
  - [Remote State Using S3 and DynamoDB](#Remote-State-Using-S3-and-DynamoDB)
    - [Deployment Steps](#Deployment-Steps)
    - [Resources Created](#Resources-Created)
  - [Local State Management](#Local-State-Management)

<!-- /TOC -->

## Remote State Using S3 and DynamoDB

Remote state management using S3 and DynamoDB leverages S3 object store as the state store and DynamoDB as the state locking mechanism. The steps to deploy this configuration is detailed below.

### Deployment Steps

1. Open up CloudFormation on the AWS account and click _Create Stack_ to deploy the CloudFormation template. The created resources are defined in [Deployment Steps](#Deployment-Steps)

2. Select _Upload Template file_ and choose the terraformworkflowinit.yaml. Then click _Next_

3. Enter a stack name and click _Next_

4. Configure stack options if required, acknowledge IAM capabilities, then click _Submit_

5. Once the stack has finished, configure your Terraform provider backend accordingly:
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

### Deployment Overview

#### Resources

| Name | Type |
|------|------|
| [TerraformSPN.terraformworkflowinit](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-user.html) | IAM User |
| [TerraformSPNAccessKey.terraformworkflowinit](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-accesskey.html) | IAM Access Key |
| [TerraformSPNAccessKeyStore.terraformworkflowinit](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-ssm-parameter.html) | SSM Store |
| [TerraformSPNSecretAccessKeyStore.terraformworkflowinit](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-ssm-parameter.html) | SSM Store |
| [RemoteStateS3Bucket.terraformworkflowinit](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-s3-bucket.html) | S3 Bucket |
| [RemoteStateDynamoDBTable.terraformworkflowinit](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-dynamodb-table.html) | DynamoDB |

#### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="TerraformSPNNameInput"></a> | Name of the IAM user provisioned as the Terraform service principal | `string` | TerraformSPN | yes |
| <a name="StateBucketNameInput"></a> | Name of the S3 bucket to store Terraform state | `string` | terraform-state | yes |

#### Outputs

| Name | Description |
|------|-------------|
| <a name="TerraformSPNAccessKeyStoreURLOutput"></a> | Output the SSM location of the Terraform SPN access credentials |
| <a name="RemoteStateBucketNameOutput"></a> | S3 bucket name |
| <a name="RemoteStateRegionOutput"></a> | Region of CloudFormation deployment |
| <a name="RemoteStateDynamoDBNameOutput"></a> | DynamoDB table name |


## Local State Management

For local state management you can configure an AWS CLI credential profile for Terraform to leverage for its authentication. In this method, Terraform will leverage the user logged into the AWS CLI. Alternatively, and this method is not recommended as it leverages plaintext secrets that could get pulled into git, you can ingest access key credentials as part of tfvars and Terraform will authenticate using those access keys.

## Module TODOs

- [ ] Harden the S3 bucket to prevent deletion and scope bucket write access to SPN
