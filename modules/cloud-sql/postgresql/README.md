<!-- BEGIN_TF_DOCS -->


## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_this"></a> [this](#module\_this) | GoogleCloudPlatform/sql-db/google//modules/postgresql | 16.1.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_activation_policy"></a> [activation\_policy](#input\_activation\_policy) | The activation policy for the master instance.Can be either `ALWAYS`, `NEVER` or `ON_DEMAND`. | `string` | `"ALWAYS"` | no |
| <a name="input_additional_databases"></a> [additional\_databases](#input\_additional\_databases) | A list of databases to be created in your cluster | <pre>list(object({<br>    name      = string<br>    charset   = string<br>    collation = string<br>  }))</pre> | `[]` | no |
| <a name="input_additional_users"></a> [additional\_users](#input\_additional\_users) | A list of users to be created in your cluster. A random password would be set for the user if the `random_password` variable is set. | <pre>list(object({<br>    name            = string<br>    password        = string<br>    random_password = bool<br>  }))</pre> | `[]` | no |
| <a name="input_availability_type"></a> [availability\_type](#input\_availability\_type) | The availability type for the master instance.This is only used to set up high availability for the PostgreSQL instance. Can be either `ZONAL` or `REGIONAL`. | `string` | `"REGIONAL"` | no |
| <a name="input_backup_configuration"></a> [backup\_configuration](#input\_backup\_configuration) | The backup\_configuration settings subblock for the database setings | <pre>object({<br>    enabled                        = optional(bool, false)<br>    start_time                     = optional(string)<br>    location                       = optional(string)<br>    point_in_time_recovery_enabled = optional(bool, false)<br>    transaction_log_retention_days = optional(string)<br>    retained_backups               = optional(number)<br>    retention_unit                 = optional(string)<br>  })</pre> | `{}` | no |
| <a name="input_database_flags"></a> [database\_flags](#input\_database\_flags) | The database flags for the master instance. See [more details](https://cloud.google.com/sql/docs/postgres/flags) | <pre>list(object({<br>    name  = string<br>    value = string<br>  }))</pre> | `[]` | no |
| <a name="input_database_version"></a> [database\_version](#input\_database\_version) | The database version to use | `string` | `"POSTGRES_14"` | no |
| <a name="input_db_charset"></a> [db\_charset](#input\_db\_charset) | The charset for the default database | `string` | `"UTF8"` | no |
| <a name="input_db_collation"></a> [db\_collation](#input\_db\_collation) | The collation for the default database. Example: 'en\_US.UTF8' | `string` | `"en_US.UTF8"` | no |
| <a name="input_db_name"></a> [db\_name](#input\_db\_name) | The name of the default database to create | `string` | `"pgdb"` | no |
| <a name="input_deletion_protection_enabled"></a> [deletion\_protection\_enabled](#input\_deletion\_protection\_enabled) | Enables protection of an instance from accidental deletion across all surfaces (API, gcloud, Cloud Console and Terraform). | `bool` | `true` | no |
| <a name="input_disk_autoresize"></a> [disk\_autoresize](#input\_disk\_autoresize) | Configuration to increase storage size. | `bool` | `true` | no |
| <a name="input_disk_autoresize_limit"></a> [disk\_autoresize\_limit](#input\_disk\_autoresize\_limit) | The maximum size to which storage can be auto increased. | `number` | `50` | no |
| <a name="input_disk_size"></a> [disk\_size](#input\_disk\_size) | The disk size for the master instance. | `number` | `10` | no |
| <a name="input_disk_type"></a> [disk\_type](#input\_disk\_type) | The disk type for the master instance. | `string` | `"PD_SSD"` | no |
| <a name="input_iam_users"></a> [iam\_users](#input\_iam\_users) | A list of IAM users to be created in your CloudSQL instance | <pre>list(object({<br>    id    = string,<br>    email = string<br>  }))</pre> | `[]` | no |
| <a name="input_ip_configuration"></a> [ip\_configuration](#input\_ip\_configuration) | The ip configuration for the master instances. | <pre>object({<br>    authorized_networks                           = optional(list(map(string)), [])<br>    ipv4_enabled                                  = optional(bool, true)<br>    private_network                               = optional(string)<br>    require_ssl                                   = optional(bool)<br>    allocated_ip_range                            = optional(string)<br>    enable_private_path_for_google_cloud_services = optional(bool, false)<br>    psc_enabled                                   = optional(bool, false)<br>    psc_allowed_consumer_projects                 = optional(list(string), [])<br>  })</pre> | `{}` | no |
| <a name="input_maintenance_window_day"></a> [maintenance\_window\_day](#input\_maintenance\_window\_day) | The day of week (1-7) for the master instance maintenance. | `number` | `1` | no |
| <a name="input_maintenance_window_hour"></a> [maintenance\_window\_hour](#input\_maintenance\_window\_hour) | The hour of day (0-23) maintenance window for the master instance maintenance. | `number` | `23` | no |
| <a name="input_maintenance_window_update_track"></a> [maintenance\_window\_update\_track](#input\_maintenance\_window\_update\_track) | The update track of maintenance window for the master instance maintenance.Can be either `canary` or `stable`. | `string` | `"stable"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the Cloud SQL resources | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The project ID to manage the Cloud SQL resources | `string` | n/a | yes |
| <a name="input_read_replica_name_suffix"></a> [read\_replica\_name\_suffix](#input\_read\_replica\_name\_suffix) | The optional suffix to add to the read instance name | `string` | `""` | no |
| <a name="input_read_replicas"></a> [read\_replicas](#input\_read\_replicas) | List of read replicas to create. Encryption key is required for replica in different region. For replica in same region as master set encryption\_key\_name = null | <pre>list(object({<br>    name                  = string<br>    name_override         = optional(string)<br>    tier                  = optional(string)<br>    edition               = optional(string)<br>    availability_type     = optional(string)<br>    zone                  = optional(string)<br>    disk_type             = optional(string)<br>    disk_autoresize       = optional(bool)<br>    disk_autoresize_limit = optional(number)<br>    disk_size             = optional(string)<br>    user_labels           = map(string)<br>    database_flags = optional(list(object({<br>      name  = string<br>      value = string<br>    })), [])<br>    insights_config = optional(object({<br>      query_plans_per_minute  = optional(number, 5)<br>      query_string_length     = optional(number, 1024)<br>      record_application_tags = optional(bool, false)<br>      record_client_address   = optional(bool, false)<br>    }), null)<br>    ip_configuration = object({<br>      authorized_networks                           = optional(list(map(string)), [])<br>      ipv4_enabled                                  = optional(bool)<br>      private_network                               = optional(string, )<br>      require_ssl                                   = optional(bool)<br>      allocated_ip_range                            = optional(string)<br>      enable_private_path_for_google_cloud_services = optional(bool, false)<br>      psc_enabled                                   = optional(bool, false)<br>      psc_allowed_consumer_projects                 = optional(list(string), [])<br>    })<br>    encryption_key_name = optional(string)<br>  }))</pre> | `[]` | no |
| <a name="input_region"></a> [region](#input\_region) | The region of the Cloud SQL resources | `string` | n/a | yes |
| <a name="input_tier"></a> [tier](#input\_tier) | The tier for the master instance. | `string` | `"db-f1-micro"` | no |
| <a name="input_user_name"></a> [user\_name](#input\_user\_name) | The name of the default user | `string` | `"pguser"` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | The zone for the master instance, it should be something like: `us-central1-a`, `us-east1-c`. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_generated_user_password"></a> [generated\_user\_password](#output\_generated\_user\_password) | The auto generated default user password if not input password was provided |
| <a name="output_instance_connection_name"></a> [instance\_connection\_name](#output\_instance\_connection\_name) | The connection name of the master instance to be used in connection strings |
| <a name="output_private_ip_address"></a> [private\_ip\_address](#output\_private\_ip\_address) | The first private (PRIVATE) IPv4 address assigned for the master instance |
| <a name="output_public_ip_address"></a> [public\_ip\_address](#output\_public\_ip\_address) | The first public (PRIMARY) IPv4 address assigned for the master instance |
<!-- END_TF_DOCS -->