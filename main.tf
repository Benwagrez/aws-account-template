# ========================= #
# ===== Main Executor ===== #
# ========================= #
# Purpose
# Manage all instantiated modules and providers
#
# Notes
# This module manager gives a holistic view on the environment being deployed through IAC. It provides documentation,
# clear and concise variables, and is easy to read for the purposes of understanding the code in the repo.

module "organizations" {
  source = "./modules/organization"

  common_tags = local.common_tags

  organizations_structure      = var.organizations_structure
  log_archive_account_email    = var.log_archive_account_email
  log_archive_account_name     = var.log_archive_account_name
  security_tools_account_email = var.security_tools_account_email
  security_tools_account_name  = var.security_tools_account_name
}
