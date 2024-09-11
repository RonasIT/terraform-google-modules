<!-- BEGIN_TF_DOCS -->


## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Resources

| Name | Type |
|------|------|
| [google_logging_metric.log_metric](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/logging_metric) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_metrics"></a> [metrics](#input\_metrics) | A list of log-based metrics configurations. | <pre>list(object({<br>    metric_name        = string<br>    metric_description = string<br>    filter             = string<br>    metric_kind        = string<br>    value_type         = string<br>    value_extractor    = string<br>    label_extractors   = map(string)<br>  }))</pre> | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The ID of the project where the log metric will be created. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_metric_ids"></a> [metric\_ids](#output\_metric\_ids) | IDs of the log-based metrics |
<!-- END_TF_DOCS -->