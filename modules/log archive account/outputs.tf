output "log_archive_account_id" {
  value       = aws_organizations_account.security_log_archive_account.id
  description = "The account id for the log archive account"
}
