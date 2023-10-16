output "generated_pguser_password" {
  value       = module.this.generated_user_password
  description = "The password of the default user to access database"
  sensitive   = true
}

output "generated_developer_password" {
  value       = module.this.additional_users[0].password
  description = "The password of the developer user to access database"
  sensitive   = true
}

output "private_ip_address" {
  value       = module.this.private_ip_address
  description = "The first private (PRIVATE) IPv4 address assigned for the master instance"
}
