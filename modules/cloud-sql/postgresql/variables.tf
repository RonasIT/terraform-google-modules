variable "project_id" {
  description = "Project id where service account will be created"
  type        = string
}

variable "cluster_private_access" {
  description = "Enable private access from GKE"
  default     = true
  type        = bool
}

variable "vpc_network" {
  description = "VPC network of the cluster. Must be provided when cluster_private_access is true"
  type        = string
}

variable "name" {
  description = "Name of the database"
  type        = string
}

variable "database_version" {
  description = "Database version"
  default     = "POSTGRES_14"
  type        = string
}

variable "region" {
  description = "Region of the database"
  type        = string
}

variable "zone" {
  description = "Zone of the database"
  type        = string
}

variable "availability_type" {
  description = "The availability type of database"
  default     = "REGIONAL"
  type        = string
}

variable "db_name" {
  description = "Name of the database"
  default     = "pgdb"
  type        = string
}

variable "user_name" {
  description = "Name of the database user"
  default     = "pguser"
  type        = string
}

variable "additional_databases" {
  description = "A list of databases to be created in your cluster"
  type = list(object({
    name      = string
    charset   = string
    collation = string
  }))
  default = []
}

variable "disk_autoresize" {
  description = "Disk autoresize"
  default     = true
  type        = bool
}

variable "disk_autoresize_limit" {
  description = "Disk autoresize limit"
  default     = 50
  type        = number
}

variable "disk_size" {
  description = "Disk size of the database"
  default     = 10
  type        = number
}

variable "tier" {
  description = "Database tier"
  default     = "db-f1-micro"
  type        = string
}


variable "deletion_protection_enabled" {
  description = "Deletion protection enabled"
  default     = true
  type        = bool
}

variable "backup_configuration" {
  description = "The backup_configuration settings subblock for the database setings"
  type = object({
    enabled                        = bool
    start_time                     = string
    location                       = string
    point_in_time_recovery_enabled = bool
    transaction_log_retention_days = string
    retained_backups               = number
    retention_unit                 = string
  })
  default = {
    enabled                        = true
    start_time                     = "07:00"
    location                       = "US"
    point_in_time_recovery_enabled = true
    transaction_log_retention_days = 7
    retained_backups               = null
    retention_unit                 = null
  }
}

variable "additional_users" {
  description = "Additional users will be created"
  type = list(object({
    name            = string
    password        = string
    random_password = bool
  }))
  default = [{
    name            = "developer"
    password        = ""
    random_password = true
  }]
}

variable "ip_configuration" {
  description = "The ip configuration for the master instances."
  type = object({
    authorized_networks                           = list(map(string))
    ipv4_enabled                                  = bool
    private_network                               = string
    require_ssl                                   = bool
    allocated_ip_range                            = string
    enable_private_path_for_google_cloud_services = optional(bool)
  })
  default = {
    authorized_networks                           = []
    ipv4_enabled                                  = true
    private_network                               = null
    require_ssl                                   = null
    allocated_ip_range                            = null
    enable_private_path_for_google_cloud_services = false
  }
}
