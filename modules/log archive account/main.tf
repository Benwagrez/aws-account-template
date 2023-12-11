resource "aws_organizations_account" "security_log_archive_account" {
  name  = var.log_archive_account_name
  email = var.log_archive_account_email

  parent_id = var.security_prod_ou

  tags = (merge(
    var.common_tags,
    tomap({
      "Name"        = var.log_archive_account_name,
      "Description" = "AWS account for centralized logging, Monitoring, application insights.",
    })
  ))
}
