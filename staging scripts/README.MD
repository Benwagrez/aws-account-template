- [ ] Cloudformation script that deploys Terraform SPN and S3 with DyanmoDB for state locking, outputs the necessary vars to ready Terraform workflow
- [ ] Create a step by step instruction plan for creating AWS account, launching above cloudformation script, set up terraform workflow and deploy main organization shit
- [ ] HArden the S3 bucket to prevent deletion and scope access to SPN

$ cd create_AWS_EC2
$ vim main.tf
#main.tf
provider "aws" {
   region = "us-east-1"
 }

 terraform {
   backend "s3" {
     bucket = "terraform-s3-backend-with-locking"
     key = "terraform/backend/terraform_aws.tfstate"
     region = "us-east-1"
     dynamodb_table = "terraform-s3-backend-locking"
     encrypt = true
   }
 }
