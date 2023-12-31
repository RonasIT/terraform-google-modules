module "this" {
  source                          = "GoogleCloudPlatform/sql-db/google//modules/postgresql"
  version                         = "16.1.0"
  project_id                      = var.project_id
  name                            = var.name
  database_version                = var.database_version
  region                          = var.region
  zone                            = var.zone
  tier                            = var.tier
  activation_policy               = var.activation_policy
  availability_type               = var.availability_type
  deletion_protection_enabled     = var.deletion_protection_enabled
  disk_autoresize                 = var.disk_autoresize
  disk_autoresize_limit           = var.disk_autoresize_limit
  disk_size                       = var.disk_size
  disk_type                       = var.disk_type
  backup_configuration            = var.backup_configuration
  ip_configuration                = var.ip_configuration
  maintenance_window_day          = var.maintenance_window_day
  maintenance_window_hour         = var.maintenance_window_hour
  maintenance_window_update_track = var.maintenance_window_update_track
  database_flags                  = var.database_flags
  read_replicas                   = var.read_replicas
  read_replica_name_suffix        = var.read_replica_name_suffix
  db_name                         = var.db_name
  db_charset                      = var.db_charset
  db_collation                    = var.db_collation
  user_name                       = var.user_name
  additional_databases            = var.additional_databases
  additional_users                = var.additional_users
  iam_users                       = var.iam_users
}
