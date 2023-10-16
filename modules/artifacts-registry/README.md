<!-- BEGIN_TF_DOCS -->


## Providers

| Name | Version |
|------|---------|
| <a name="provider_google-beta"></a> [google-beta](#provider\_google-beta) | n/a |

## Resources

| Name | Type |
|------|------|
| [google-beta_google_artifact_registry_repository.docker_repository](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_artifact_registry_repository) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_docker_repository_ids"></a> [docker\_repository\_ids](#input\_docker\_repository\_ids) | List of repository ids to create | `set(string)` | `[]` | no |
| <a name="input_location"></a> [location](#input\_location) | The name of the location this repository is located in | `string` | `"europe-west2"` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Project id where service account will be created | `string` | n/a | yes |
<!-- END_TF_DOCS -->