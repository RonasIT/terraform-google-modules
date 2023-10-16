<!-- BEGIN_TF_DOCS -->


## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_developer"></a> [developer](#module\_developer) | terraform-google-modules/iam/google//modules/custom_role_iam | ~>7.6.0 |
| <a name="module_gitlab"></a> [gitlab](#module\_gitlab) | terraform-google-modules/service-accounts/google | ~>4.2.1 |
| <a name="module_storage"></a> [storage](#module\_storage) | terraform-google-modules/service-accounts/google | ~>4.2.1 |
| <a name="module_teamlead"></a> [teamlead](#module\_teamlead) | terraform-google-modules/iam/google//modules/projects_iam | ~> 7.7.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_developer_members"></a> [developer\_members](#input\_developer\_members) | List of members for developer role | `list(string)` | `[]` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Project id where service account will be created | `any` | n/a | yes |
| <a name="input_teamlead_members"></a> [teamlead\_members](#input\_teamlead\_members) | List of members for devops role | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_gitlab_email"></a> [gitlab\_email](#output\_gitlab\_email) | n/a |
| <a name="output_gitlab_key"></a> [gitlab\_key](#output\_gitlab\_key) | n/a |
| <a name="output_storage_email"></a> [storage\_email](#output\_storage\_email) | n/a |
| <a name="output_storage_key"></a> [storage\_key](#output\_storage\_key) | n/a |
<!-- END_TF_DOCS -->