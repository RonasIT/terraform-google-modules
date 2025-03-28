output "gitlab_email" {
  value = module.gitlab.email
}

output "gitlab_key" {
  value     = module.gitlab.key
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
