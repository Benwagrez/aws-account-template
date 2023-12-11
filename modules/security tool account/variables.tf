variable "common_tags" {
  type        = map(string)
  description = "Common tags to provision on resources created in Terraform."
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

variable "security_prod_ou" {
  type        = string
  description = "ID for the Prod child OU under the Security base OU"
}
