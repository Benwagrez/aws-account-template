# AWS Green-Field Organizations Module

<!-- [![Checkov](https://github.com/aws-samples/aws-terraform-template/actions/workflows/checkov.yml/badge.svg)](https://github.com/aws-samples/aws-terraform-template/actions/workflows/checkov.yml)
[![TFLint](https://github.com/aws-samples/aws-terraform-template/actions/workflows/tflint.yml/badge.svg)](https://github.com/aws-samples/aws-terraform-template/actions/workflows/tflint.yml)
[![terraform-docs](https://github.com/aws-samples/aws-terraform-template/actions/workflows/terraform-docs.yml/badge.svg)](https://github.com/aws-samples/aws-terraform-template/actions/workflows/terraform-docs.yml)
[![Terratest PR](https://github.com/aws-samples/aws-terraform-template/actions/workflows/terratest-pr.yml/badge.svg)](https://github.com/aws-samples/aws-terraform-template/actions/workflows/terratest-pr.yml) -->

This repository holds code to deploy a green-field organizations structure on AWS.

<!-- TOC -->

- [AWS Terraform Module Template](#aws-terraform-module-template)
  - [Repository configuration checklist](#repository-configuration-checklist)
  - [Requirements](#requirements)
  - [Providers](#providers)
  - [Modules](#modules)
  - [Resources](#resources)
  - [Inputs](#inputs)
  - [Outputs](#outputs)
  - [Security](#security)
  - [License](#license)
  - [Requirements](#requirements)
  - [Providers](#providers)
  - [Modules](#modules)
  - [Resources](#resources)
  - [Inputs](#inputs)
  - [Outputs](#outputs)

<!-- /TOC -->

## Dev TODO checklist

> TODO list

- [x] Configure Terraform cloud to be used with this deployment, include documentation for creating IAM OIDC provider for Terraform and proper role || Configured as stated in the following: https://developer.hashicorp.com/terraform/cloud-docs/workspaces/dynamic-provider-credentials/aws-configuration#create-an-oidc-identity-provider
- [x] Create the repository secrets, variables and environments as documented in the [Terraform Reusable Workflow Prerequisites](https://github.com/aws-samples/aws-terraform-reusable-workflow#prerequisites).
- [x] Update the [Deploy workflow](./.github/workflows/deploy.yml) with your environment, regions, and workflow triggers.
- [ ] Populate staging scripts folder with an AWS CLI based script that dynamically deploys an S3 DynamoDB remote state based on configured AWS profile
- [ ] Recreate organizations cloudformation script in Terraform
- [ ] Create folder to hold policy configurations; create an AWS Config conformance pack

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >=5.0.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >=3.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_random"></a> [random](#provider\_random) | >=3.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [random_pet.main](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/pet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | The environment where to deploy the solution | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Region where to deploy the resources | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_hello_world"></a> [hello\_world](#output\_hello\_world) | Test output used by Terrastest |
| <a name="output_random_pet"></a> [random\_pet](#output\_random\_pet) | Dummy output |
<!-- END_TF_DOCS -->

## Security

See [CONTRIBUTING](CONTRIBUTING.md#security-issue-notifications) for more information.

## License

This library is licensed under the MIT-0 License. See the LICENSE file.
