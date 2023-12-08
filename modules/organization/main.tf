# AWS Organization

resource "aws_organizations_organization" "organization_root" {
  aws_service_access_principals = [
    "cloudtrail.amazonaws.com",
    "config.amazonaws.com",
  ]
  enabled_policy_types = ["AISERVICES_OPT_OUT_POLICY", "BACKUP_POLICY", "SERVICE_CONTROL_POLICY", "TAG_POLICY"]
  feature_set          = "ALL"
}

# Base OU Factory

resource "aws_organizations_organizational_unit" "base_root_ou" {
  for_each = {
    for ou in var.organizations_structure :
    ou.id => ou
  }

  name      = each.value.id
  parent_id = aws_organizations_organization.organization_root.roots[0].id
}

# Child OU Factory

resource "aws_organizations_organizational_unit" "base_child_ou" {
  for_each = {
    for ou in local.child_ou_factory :
    ou.id => ou
  }

  name      = each.value.name
  parent_id = aws_organizations_organizational_unit.base_root_ou[each.value.parent].id
}

# # Security OUs
# resource "aws_organizations_organizational_unit" "security_root_ou" {
#   name      = "Security"
#   parent_id = aws_organizations_organization.organization_root.roots[0].id
# }

# resource "aws_organizations_organizational_unit" "security_production_ou" {
#   name      = "Prod"
#   parent_id = aws_organizations_organizational_unit.security_root_ou.id
# }

# # Infrastructure OUs
# resource "aws_organizations_organizational_unit" "infrastructure_root_ou" {
#   name      = "Infrastructure"
#   parent_id = aws_organizations_organization.organization_root.roots[0].id
# }

# # Workload OUs
# resource "aws_organizations_organizational_unit" "workload_root_ou" {
#   name      = "Workload"
#   parent_id = aws_organizations_organization.organization_root.roots[0].id
# }

# resource "aws_organizations_organizational_unit" "workload_production_ou" {
#   name      = "Prod"
#   parent_id = aws_organizations_organizational_unit.workload_root_ou.id
# }

# resource "aws_organizations_organizational_unit" "workload_dev_ou" {
#   name      = "Dev"
#   parent_id = aws_organizations_organizational_unit.workload_root_ou.id
# }

# # Sandbox OUs
# resource "aws_organizations_organizational_unit" "sandbox_root_ou" {
#   name      = "Sandbox"
#   parent_id = aws_organizations_organization.organization_root.roots[0].id
# }
