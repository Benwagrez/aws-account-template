# ==================================== #
# ===== AWS Account Orchestrator ===== #
# ==================================== #

module "organizations" {
  source = "./modules/organization"

  common_tags = local.common_tags

  region                      = var.region
  organizations_structure     = var.organizations_structure
  deploy_conformance_pack     = var.deploy_conformance_pack
  log_archive_account_email   = var.log_archive_account_email
  log_archive_account_name    = var.log_archive_account_name
  security_tool_account_email = var.security_tool_account_email
  security_tool_account_name  = var.security_tool_account_name
}
