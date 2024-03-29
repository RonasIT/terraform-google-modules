output "public_ip_address" {
  description = "The first public (PRIMARY) IPv4 address assigned for the master instance"
  value       = module.this.public_ip_address
}

output "private_ip_address" {
  description = "The first private (PRIVATE) IPv4 address assigned for the master instance"
  value       = module.this.private_ip_address
}

output "instance_connection_name" {
  value       = module.this.instance_connection_name
  description = "The connection name of the master instance to be used in connection strings"
}

output "generated_user_password" {
  description = "The auto generated default user password if not input password was provided"
  value       = module.this.generated_user_password
  sensitive   = true
}

output "iam_users" {
  description = "The list of the IAM users with access to the CloudSQL instance"
  value       = module.this.iam_users
}

output "additional_users" {
  description = "List of maps of additional users and passwords"
  value       = module.this.additional_users
  sensitive   = true
}
