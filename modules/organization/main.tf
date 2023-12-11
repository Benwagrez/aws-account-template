
# Modules to deploy log archive and security tool account

module "log_archive_account" {
  source = "./../log archive account"

  log_archive_account_name  = var.log_archive_account_name
  log_archive_account_email = var.log_archive_account_email
  security_prod_ou          = aws_organizations_organizational_unit.base_child_ou["security-prod"].id
  common_tags               = merge(var.common_tags, local.tags)
}

module "security_tool_account" {
  source = "./../security tool account"

  security_tool_account_name  = var.security_tool_account_name
  security_tool_account_email = var.security_tool_account_email
  security_prod_ou            = aws_organizations_organizational_unit.base_child_ou["security-prod"].id
  common_tags                 = merge(var.common_tags, local.tags)
}
