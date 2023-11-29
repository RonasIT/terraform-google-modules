<!-- BEGIN_TF_DOCS -->


## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |
| <a name="provider_google-beta.impersonated"></a> [google-beta.impersonated](#provider\_google-beta.impersonated) | n/a |

## Resources

| Name | Type |
|------|------|
| [google-beta_google_apikeys_key.api_keys](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_apikeys_key) | resource |
| [google_project_service.apikeys](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_service) | resource |
| [google_project_service.apis](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_service) | resource |
| [google-beta_google_client_openid_userinfo.impersonated](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/data-sources/google_client_openid_userinfo) | data source |
| [google_service_account_access_token.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/service_account_access_token) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gcp_service_list"></a> [gcp\_service\_list](#input\_gcp\_service\_list) | The list of apis necessary for the project | `map` | <pre>{<br>  "geocoding": "geocoding-backend.googleapis.com",<br>  "places": "places-backend.googleapis.com"<br>}</pre> | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The ID of the project | `string` | n/a | yes |
| <a name="input_service_account_email"></a> [service\_account\_email](#input\_service\_account\_email) | The service account name to impersonate (must have roles/serviceusage.apiKeysAdmin) | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_api_keys"></a> [api\_keys](#output\_api\_keys) | The API keys |
<!-- END_TF_DOCS -->