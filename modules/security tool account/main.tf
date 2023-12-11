resource "aws_organizations_account" "security_tool_account" {
  name  = var.security_tool_account_name
  email = var.security_tool_account_email

  parent_id = var.security_prod_ou

  tags = (merge(
    var.common_tags,
    tomap({
      "Name"        = var.security_tool_account_name,
      "Description" = "AWS account for peventative and responsive security controls.",
    })
  ))
}
