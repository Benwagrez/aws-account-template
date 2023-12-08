# Security accounts

resource "aws_organizations_account" "security_log_archive_account" {
  name  = var.log_archive_account_name
  email = var.log_archive_account_email

  parent_id = aws_organizations_organizational_unit.base_child_ou["security-prod"].id

  tags = (merge(
    var.common_tags,
    local.tags,
    tomap({
      "Name"        = var.log_archive_account_name,
      "Description" = "AWS account for centralized logging, Monitoring, application insights.",
    })
  ))
}

resource "aws_organizations_account" "security_tools_account" {
  name  = var.security_tools_account_name
  email = var.security_tools_account_email

  parent_id = aws_organizations_organizational_unit.base_child_ou["security-prod"].id

  tags = (merge(
    var.common_tags,
    local.tags,
    tomap({
      "Name"        = var.log_archive_account_name,
      "Description" = "AWS account for peventative and responsive security controls.",
    })
  ))
}
