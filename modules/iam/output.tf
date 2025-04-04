output "gitlab_email" {
  value = var.create_single_gitlab_account ? module.gitlab[0].email : "Account not created"
}

output "gitlab_key" {
  value     = var.create_single_gitlab_account ? module.gitlab[0].key : "Account not created"
  sensitive = true
}

output "api_email" {
  value = module.api.email
}

output "api_key" {
  value     = module.api.key
  sensitive = true
}

output "additional_service_accounts" {
  value       = module.additional_service_accounts
  description = "Additional service accounts"
  sensitive   = true
}

output "gitlab_runner_ci_key" {
  value     = !var.create_single_gitlab_account ? module.gitlab_runner_ci[0].key : "Account not created"
  sensitive = true
}
output "gitlab_runner_cd_key" {
  value     = !var.create_single_gitlab_account ? module.gitlab_runner_cd[0].key : "Account not created"
  sensitive = true
}
