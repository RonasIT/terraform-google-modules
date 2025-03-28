output "gitlab_email" {
  value = module.gitlab[0].email
}

output "gitlab_key" {
  value     = module.gitlab[0].key
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
