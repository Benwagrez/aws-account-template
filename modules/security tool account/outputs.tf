output "security_tool_account_id" {
  value       = aws_organizations_account.security_tool_account.id
  description = "The account id for the security tool account"
}
