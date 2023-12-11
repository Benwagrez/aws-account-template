
output "log_archive_account_id" {
  value       = module.log_archive_account.log_archive_account_id
  description = "The account id for the log archive account"
}

output "security_tools_account_id" {
  value       = module.security_tool_account.security_tool_account_id
  description = "The account id for the security tool account"
}
