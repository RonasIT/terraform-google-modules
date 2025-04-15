<!-- BEGIN_TF_DOCS -->


## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_additional_service_accounts"></a> [additional\_service\_accounts](#module\_additional\_service\_accounts) | terraform-google-modules/service-accounts/google | ~>4.2.1 |
| <a name="module_api"></a> [api](#module\_api) | terraform-google-modules/service-accounts/google | ~>4.2.1 |
| <a name="module_developer"></a> [developer](#module\_developer) | terraform-google-modules/iam/google//modules/custom_role_iam | ~>7.7.0 |
| <a name="module_gitlab"></a> [gitlab](#module\_gitlab) | terraform-google-modules/service-accounts/google | ~>4.2.1 |
| <a name="module_gitlab_runner_cd"></a> [gitlab\_runner\_cd](#module\_gitlab\_runner\_cd) | terraform-google-modules/service-accounts/google | ~>4.2.1 |
| <a name="module_gitlab_runner_ci"></a> [gitlab\_runner\_ci](#module\_gitlab\_runner\_ci) | terraform-google-modules/service-accounts/google | ~>4.2.1 |
| <a name="module_teamlead"></a> [teamlead](#module\_teamlead) | terraform-google-modules/iam/google//modules/projects_iam | ~> 7.7.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_api_roles"></a> [additional\_api\_roles](#input\_additional\_api\_roles) | List of additional API roles | `list(string)` | `[]` | no |
| <a name="input_additional_gitlab_cd_roles"></a> [additional\_gitlab\_cd\_roles](#input\_additional\_gitlab\_cd\_roles) | List of additional roles for Gitlab CD runner | `list(string)` | `[]` | no |
| <a name="input_additional_gitlab_ci_roles"></a> [additional\_gitlab\_ci\_roles](#input\_additional\_gitlab\_ci\_roles) | List of additional roles for Gitlab CI runner | `list(string)` | `[]` | no |
| <a name="input_additional_service_accounts"></a> [additional\_service\_accounts](#input\_additional\_service\_accounts) | Additional service accounts | <pre>list(object({<br/>    name          = string<br/>    description   = string<br/>    generate_keys = bool<br/>    project_roles = list(string)<br/>  }))</pre> | `[]` | no |
| <a name="input_api_serviceaccount_name"></a> [api\_serviceaccount\_name](#input\_api\_serviceaccount\_name) | name for API Service Account | `string` | n/a | yes |
| <a name="input_create_single_gitlab_account"></a> [create\_single\_gitlab\_account](#input\_create\_single\_gitlab\_account) | Whether to create single gitlab service account | `bool` | `false` | no |
| <a name="input_developer_members"></a> [developer\_members](#input\_developer\_members) | List of members for developer role | `list(string)` | `[]` | no |
| <a name="input_generate_api_keys"></a> [generate\_api\_keys](#input\_generate\_api\_keys) | Whether to generate keys for gitlab CD service account | `bool` | `false` | no |
| <a name="input_generate_gitlab_cd_keys"></a> [generate\_gitlab\_cd\_keys](#input\_generate\_gitlab\_cd\_keys) | Whether to generate keys for gitlab CD service account | `bool` | `false` | no |
| <a name="input_generate_gitlab_ci_keys"></a> [generate\_gitlab\_ci\_keys](#input\_generate\_gitlab\_ci\_keys) | Whether to generate keys for gitlab CI service account | `bool` | `false` | no |
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
| <a name="output_gitlab_runner_cd_key"></a> [gitlab\_runner\_cd\_key](#output\_gitlab\_runner\_cd\_key) | n/a |
| <a name="output_gitlab_runner_ci_key"></a> [gitlab\_runner\_ci\_key](#output\_gitlab\_runner\_ci\_key) | n/a |
<!-- END_TF_DOCS -->

## Upgrading

### To 0.7.0

Without these state migrations, Terraform would destroy and recreate resources when module paths change, causing potential downtime and data loss.

```sh
terragrunt state mv \
  "module.gitlab.google_project_iam_member.project-roles[\"gitlab-coronation-insurance-kenya=>roles/editor\"]" \
  "module.gitlab[0].google_project_iam_member.project-roles[\"gitlab-coronation-insurance-kenya=>roles/editor\"]"

terragrunt state mv \
  "module.gitlab.google_service_account.service_accounts[\"gitlab\"]" \
  "module.gitlab[0].google_service_account.service_accounts[\"gitlab\"]"

terragrunt state mv \
  "module.gitlab.google_service_account_key.keys[\"gitlab\"]" \
  "module.gitlab[0].google_service_account_key.keys[\"gitlab\"]"

terragrunt state mv \
  "module.storage.google_service_account.service_accounts[\"storage\"]" \
  "module.api.google_service_account.service_accounts[\"storage\"]"

terragrunt state mv \
  "module.storage.google_service_account_key.keys[\"storage\"]" \
  "module.api.google_service_account.service_accounts[\"storage\"]"

terragrunt state mv \
  "module.storage.google_project_iam_member.project-roles[\"storage-coronation-insurance-kenya=>roles/storage.admin\"]" \
  "module.api.google_project_iam_member.project-roles[\"storage-coronation-insurance-kenya=>roles/storage.admin\"]"

terragrunt state mv \
  "module.storage.google_service_account_key.keys["\storage"\]" \
  "module.api.google_service_account_key.keys["\storage"\]"

terragrunt state mv \
  "module.storage.google_service_account_key.keys[\"storage\"]" \
  "module.api.google_service_account_key.keys[\"storage\"]"
```
