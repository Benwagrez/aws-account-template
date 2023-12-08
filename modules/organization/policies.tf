# AI services opt out policy

resource "aws_organizations_policy" "policy_ai_services_data_collection_opt_out" {
  name    = "PolicyAIServicesDataCollectionOptOut"
  content = file("${path.module}/../../policies/optout/PolicyAIServicesDataCollectionOptOut.yaml")
}

resource "aws_organizations_policy_attachment" "policy_ai_services_data_collection_opt_out_attachment" {
  policy_id = aws_organizations_policy.policy_ai_services_data_collection_opt_out.id
  target_id = aws_organizations_organization.organization_root.roots[0].id
}

# SCP deny policies

resource "aws_organizations_policy" "policy_scp_deny_control_resource_changes" {
  name    = "PolicySCPDenyControlResourceChanges"
  content = file("${path.module}/../../policies/scp/PolicySCPDenyControlResourceChanges.yaml")
}

resource "aws_organizations_policy_attachment" "policy_scp_deny_control_resource_changes_attachment" {
  policy_id = aws_organizations_policy.policy_scp_deny_control_resource_changes.id
  target_id = aws_organizations_organization.organization_root.roots[0].id
}

resource "aws_organizations_policy" "policy_scp_deny_organization_withdraw" {
  name    = "PolicySCPDenyOrganizationWithdraw"
  content = file("${path.module}/../../policies/scp/PolicySCPDenyOrganizationWithdraw.yaml")
}

resource "aws_organizations_policy_attachment" "policy_scp_deny_organization_withdraw_attachment" {
  policy_id = aws_organizations_policy.policy_scp_deny_organization_withdraw.id
  target_id = aws_organizations_organization.organization_root.roots[0].id
}

resource "aws_organizations_policy" "policy_scp_deny_disallowed_region" {
  name    = "PolicySCPDenyAllDisallowedRegions"
  content = file("${path.module}/../../policies/scp/PolicySCPDenyAllDisallowedRegions.yaml")
}

resource "aws_organizations_policy_attachment" "policy_scp_deny_disallowed_region_attachment" {
  policy_id = aws_organizations_policy.policy_scp_deny_disallowed_region.id
  target_id = aws_organizations_organization.organization_root.roots[0].id
}

# Tagging policy

resource "aws_organizations_policy" "policy_organization_tagging" {
  name    = "PolicyOrganizationTagging"
  content = file("${path.module}/../../policies/tag/PolicyOrganizationTagging.yaml")
}

resource "aws_organizations_policy_attachment" "policy_organization_tagging_attachment" {
  policy_id = aws_organizations_policy.policy_organization_tagging.id
  target_id = aws_organizations_organization.organization_root.roots[0].id
}
