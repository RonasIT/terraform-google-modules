<!-- BEGIN_TF_DOCS -->


## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_postgresql_private_access"></a> [postgresql\_private\_access](#module\_postgresql\_private\_access) | GoogleCloudPlatform/sql-db/google//modules/private_service_access | 16.1.0 |
| <a name="module_this"></a> [this](#module\_this) | GoogleCloudPlatform/sql-db/google//modules/postgresql | 16.1.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_databases"></a> [additional\_databases](#input\_additional\_databases) | A list of databases to be created in your cluster | <pre>list(object({<br>    name      = string<br>    charset   = string<br>    collation = string<br>  }))</pre> | `[]` | no |
| <a name="input_additional_users"></a> [additional\_users](#input\_additional\_users) | Additional users will be created | <pre>list(object({<br>    name            = string<br>    password        = string<br>    random_password = bool<br>  }))</pre> | <pre>[<br>  {<br>    "name": "developer",<br>    "password": "",<br>    "random_password": true<br>  }<br>]</pre> | no |
| <a name="input_availability_type"></a> [availability\_type](#input\_availability\_type) | The availability type of database | `string` | `"REGIONAL"` | no |
| <a name="input_backup_configuration"></a> [backup\_configuration](#input\_backup\_configuration) | The backup\_configuration settings subblock for the database setings | <pre>object({<br>    enabled                        = bool<br>    start_time                     = string<br>    location                       = string<br>    point_in_time_recovery_enabled = bool<br>    transaction_log_retention_days = string<br>    retained_backups               = number<br>    retention_unit                 = string<br>  })</pre> | <pre>{<br>  "enabled": true,<br>  "location": "US",<br>  "point_in_time_recovery_enabled": true,<br>  "retained_backups": null,<br>  "retention_unit": null,<br>  "start_time": "07:00",<br>  "transaction_log_retention_days": 7<br>}</pre> | no |
| <a name="input_cluster_private_access"></a> [cluster\_private\_access](#input\_cluster\_private\_access) | Enable private access from GKE | `bool` | `true` | no |
| <a name="input_database_version"></a> [database\_version](#input\_database\_version) | Database version | `string` | `"POSTGRES_14"` | no |
| <a name="input_db_name"></a> [db\_name](#input\_db\_name) | Name of the database | `string` | `"pgdb"` | no |
| <a name="input_deletion_protection_enabled"></a> [deletion\_protection\_enabled](#input\_deletion\_protection\_enabled) | Deletion protection enabled | `bool` | `true` | no |
| <a name="input_disk_autoresize"></a> [disk\_autoresize](#input\_disk\_autoresize) | Disk autoresize | `bool` | `true` | no |
| <a name="input_disk_autoresize_limit"></a> [disk\_autoresize\_limit](#input\_disk\_autoresize\_limit) | Disk autoresize limit | `number` | `50` | no |
| <a name="input_disk_size"></a> [disk\_size](#input\_disk\_size) | Disk size of the database | `number` | `10` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the database | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Project id where service account will be created | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Region of the database | `string` | n/a | yes |
| <a name="input_tier"></a> [tier](#input\_tier) | Database tier | `string` | `"db-f1-micro"` | no |
| <a name="input_user_name"></a> [user\_name](#input\_user\_name) | Name of the database user | `string` | `"pguser"` | no |
| <a name="input_vpc_network"></a> [vpc\_network](#input\_vpc\_network) | VPC network of the cluster. Must be provided when cluster\_private\_access is true | `string` | n/a | yes |
| <a name="input_zone"></a> [zone](#input\_zone) | Zone of the database | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_generated_developer_password"></a> [generated\_developer\_password](#output\_generated\_developer\_password) | The password of the developer user to access database |
| <a name="output_generated_pguser_password"></a> [generated\_pguser\_password](#output\_generated\_pguser\_password) | The password of the default user to access database |
| <a name="output_private_ip_address"></a> [private\_ip\_address](#output\_private\_ip\_address) | The first private (PRIVATE) IPv4 address assigned for the master instance |
<!-- END_TF_DOCS -->