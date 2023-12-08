# Basic

region     = "us-east-1"
evironment = "Prod"

# Organization module

organizations_structure = [
  {
    id           = "Security",
    child_ou_ids = ["Prod", "Dev"]
  },
  {
    id           = "Infra",
    child_ou_ids = []
  },
  {
    id           = "Workload",
    child_ou_ids = []
  },
  {
    id           = "Sandbox",
    child_ou_ids = []
}]

log_archive_account_email    = "benwagrez+21321412342@gmail.com"
security_tools_account_email = "benwagrez+21322147842@gmail.com"
