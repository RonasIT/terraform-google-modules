output "gitlab_email" {
  value = module.gitlab.email
}

output "gitlab_key" {
  value     = module.gitlab.key
  sensitive = true
}

output "storage_email" {
  value = module.storage.email
}

output "storage_key" {
  value     = module.storage.key
  sensitive = true
}

output "additional_service_accounts" {
  value = module.additional_service_accounts
  description = "Additional service accounts"
  sensitive = true
}
