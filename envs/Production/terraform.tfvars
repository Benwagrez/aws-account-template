# Basic

region      = "us-east-1"
environment = "Prod"

####### Organization module #######
# Org Structure
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

# Foundational accounts' details
log_archive_account_email   = "benwagrez+21321412342@gmail.com"
security_tool_account_email = "benwagrez+21322147842@gmail.com"

# OPTIONAL deploy guard duty
deploy_guard_duty                  = false
s3_access_log_bucket_name          = "guard-duty-store"
log_archive_account_s3_bucket_name = ""
guard_duty_s3_bucket_name          = ""
lifecycle_policy_days              = 365

####### /Organization module #######
