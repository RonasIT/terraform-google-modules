module "postgresql_private_access" {
  count       = var.cluster_private_access ? 1 : 0
  source      = "GoogleCloudPlatform/sql-db/google//modules/private_service_access"
  version     = "16.1.0"
  project_id  = var.project_id
  vpc_network = var.vpc_network
}

module "this" {
  source                          = "GoogleCloudPlatform/sql-db/google//modules/postgresql"
  version                         = "16.1.0"
  name                            = var.name
  project_id                      = var.project_id
  database_version                = var.database_version
  region                          = var.region
  zone                            = var.zone
  availability_type               = var.availability_type
  maintenance_window_update_track = "stable"
  db_name                         = var.db_name
  db_charset                      = "UTF8"
  db_collation                    = "en_US.UTF8"
  additional_databases            = var.additional_databases
  additional_users                = var.additional_users
  user_name                       = var.user_name
  create_timeout                  = "2h"
  disk_autoresize                 = var.disk_autoresize
  disk_autoresize_limit           = var.disk_autoresize_limit
  disk_size                       = var.disk_size
  tier                            = var.tier
  backup_configuration            = var.backup_configuration
  deletion_protection_enabled     = var.deletion_protection_enabled
  ip_configuration                = var.ip_configuration
}
