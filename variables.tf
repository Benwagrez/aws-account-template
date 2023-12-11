# Basic

variable "region" {
  description = "Region where to deploy the resources."
  type        = string
}

variable "environment" {
  type        = string
  description = "The environment where to deploy the solution."
}

# Organization module ####

variable "organizations_structure" {
  type = list(object({
    id           = string,
    child_ou_ids = list(string)
  }))

  validation {
    condition     = var.organizations_structure[0].id == "Security" && contains(var.organizations_structure[0].child_ou_ids, "Prod")
    error_message = "The organizational structure requires a primary foundational OU of security, with a child OU of Prod"
  }
  description = "List(object) structure definition for AWS Organization."
}

variable "deploy_conformance_pack" {
  type        = bool
  nullable    = true
  description = "Boolean to deploy AWS Organization config conformance pack."
}

variable "log_archive_account_email" {
  type        = string
  description = "Email for the log archive AWS account to be provisioned in the Security OU as a foundational AWS account."
}

variable "log_archive_account_name" {
  type        = string
  nullable    = true
  description = "Name for the log archive AWS account to be provisioned in the Security OU as a foundational AWS account."
}

variable "security_tool_account_email" {
  type        = string
  description = "Email for the security tools AWS account to be provisioned in the Security OU as a foundational AWS account."
}

variable "security_tool_account_name" {
  type        = string
  nullable    = true
  description = "Name for the security tools AWS account to be provisioned in the Security OU as a foundational AWS account."
}
####
