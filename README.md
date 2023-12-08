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
- [X] Populate staging scripts folder with an AWS CLI based script that dynamically deploys an S3 DynamoDB remote state based on configured AWS profile
- [ ] Add a module for organizations
- [ ] Validate config against trusted advisor recommendations
- [ ] Recreate organizations cloudformation script in Terraform
- [ ] Create folder to hold policy configurations; create an AWS Config conformance pack
- [ ] Scope the Terraform SPNs access through IAM policy using access analyzer post deployments

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >=5.0.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >=3.0.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_organizations"></a> [organizations](#module\_organizations) | ./modules/organization | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | The environment where to deploy the solution. | `string` | n/a | yes |
| <a name="input_log_archive_account_email"></a> [log\_archive\_account\_email](#input\_log\_archive\_account\_email) | Email for the log archive AWS account to be provisioned in the Security OU as a foundational AWS account. | `string` | n/a | yes |
| <a name="input_log_archive_account_name"></a> [log\_archive\_account\_name](#input\_log\_archive\_account\_name) | Name for the log archive AWS account to be provisioned in the Security OU as a foundational AWS account. | `string` | n/a | yes |
| <a name="input_organizations_structure"></a> [organizations\_structure](#input\_organizations\_structure) | List(object) structure definition for AWS Organization. | <pre>list(object({<br>    id           = string,<br>    child_ou_ids = list(string)<br>  }))</pre> | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Region where to deploy the resources. | `string` | n/a | yes |
| <a name="input_security_tools_account_email"></a> [security\_tools\_account\_email](#input\_security\_tools\_account\_email) | Email for the security tools AWS account to be provisioned in the Security OU as a foundational AWS account. | `string` | n/a | yes |
| <a name="input_security_tools_account_name"></a> [security\_tools\_account\_name](#input\_security\_tools\_account\_name) | Name for the security tools AWS account to be provisioned in the Security OU as a foundational AWS account. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->

## Security

See [CONTRIBUTING](CONTRIBUTING.md#security-issue-notifications) for more information.

## License

This library is licensed under the MIT-0 License. See the LICENSE file.
