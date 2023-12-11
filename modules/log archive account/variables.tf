variable "common_tags" {
  type        = map(string)
  description = "Common tags to provision on resources created in Terraform."
}

variable "log_archive_account_email" {
  type        = string
  description = "Email for the log archive AWS account to be provisioned in the Security OU as a foundational AWS account."
}

variable "log_archive_account_name" {
  type        = string
  default     = "Log Archive"
  description = "Name for the log archive AWS account to be provisioned in the Security OU as a foundational AWS account."
}

variable "security_prod_ou" {
  type        = string
  description = "ID for the Prod child OU under the Security base OU"
}
