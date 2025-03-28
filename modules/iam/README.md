<!-- BEGIN_TF_DOCS -->


## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_additional_service_accounts"></a> [additional\_service\_accounts](#module\_additional\_service\_accounts) | terraform-google-modules/service-accounts/google | ~>4.2.1 |
| <a name="module_api"></a> [api](#module\_api) | terraform-google-modules/service-accounts/google | ~>4.2.1 |
| <a name="module_developer"></a> [developer](#module\_developer) | terraform-google-modules/iam/google//modules/custom_role_iam | ~>7.7.0 |
| <a name="module_gitlab"></a> [gitlab](#module\_gitlab) | terraform-google-modules/service-accounts/google | ~>4.2.1 |
| <a name="module_teamlead"></a> [teamlead](#module\_teamlead) | terraform-google-modules/iam/google//modules/projects_iam | ~> 7.7.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_service_accounts"></a> [additional\_service\_accounts](#input\_additional\_service\_accounts) | Additional service accounts | <pre>list(object({<br/>    name          = string<br/>    description   = string<br/>    generate_keys = bool<br/>    project_roles = list(string)<br/>  }))</pre> | `[]` | no |
| <a name="input_api_serviceaccount_name"></a> [api\_serviceaccount\_name](#input\_api\_serviceaccount\_name) | name for API Service Account | `string` | n/a | yes |
| <a name="input_api_serviceaccount_roles"></a> [api\_serviceaccount\_roles](#input\_api\_serviceaccount\_roles) | list of roles for API Service Account | `list(string)` | n/a | yes |
| <a name="input_create_single_gitlab_account"></a> [create\_single\_gitlab\_account](#input\_create\_single\_gitlab\_account) | Whether to create single gitlab service account | `bool` | `false` | no |
| <a name="input_developer_members"></a> [developer\_members](#input\_developer\_members) | List of members for developer role | `list(string)` | `[]` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Project id where service account will be created | `string` | n/a | yes |
| <a name="input_teamlead_members"></a> [teamlead\_members](#input\_teamlead\_members) | List of members for teamlead role | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_additional_service_accounts"></a> [additional\_service\_accounts](#output\_additional\_service\_accounts) | Additional service accounts |
| <a name="output_api_email"></a> [api\_email](#output\_api\_email) | n/a |
| <a name="output_api_key"></a> [api\_key](#output\_api\_key) | n/a |
| <a name="output_gitlab_email"></a> [gitlab\_email](#output\_gitlab\_email) | n/a |
| <a name="output_gitlab_key"></a> [gitlab\_key](#output\_gitlab\_key) | n/a |
<!-- END_TF_DOCS -->