# Basic

variable "region" {
  description = "Region where to deploy the resources."
  type        = string
}

variable "common_tags" {
  type        = map(string)
  description = "Common tags to provision on resources created in Terraform."
}

# Organization hierarchial structure

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

# Config variables

variable "deploy_conformance_pack" {
  type        = bool
  default     = false
  description = "Boolean to deploy AWS Organization config conformance pack."
}

# Account variables

variable "log_archive_account_email" {
  type        = string
  description = "Email for the log archive AWS account to be provisioned in the Security OU as a foundational AWS account."
}

variable "log_archive_account_name" {
  type        = string
  default     = "Log Archive"
  description = "Name for the log archive AWS account to be provisioned in the Security OU as a foundational AWS account."
}

variable "security_tool_account_email" {
  type        = string
  description = "Email for the security tools AWS account to be provisioned in the Security OU as a foundational AWS account."
}

variable "security_tool_account_name" {
  type        = string
  default     = "Security"
  description = "Name for the security tools AWS account to be provisioned in the Security OU as a foundational AWS account."
}
