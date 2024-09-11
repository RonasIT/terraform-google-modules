<!-- BEGIN_TF_DOCS -->


## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Resources

| Name | Type |
|------|------|
| [google_monitoring_alert_policy.cpu_utilization_alert_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_alert_policy) | resource |
| [google_monitoring_notification_channel.email_channels](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_notification_channel) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alert_policies"></a> [alert\_policies](#input\_alert\_policies) | A list of alert policies for log-based metrics, each containing conditions, thresholds, durations, and other settings. | <pre>list(object({<br>    display_name       = string<br>    metric_type        = string<br>    threshold          = number<br>    duration           = string<br>    comparison         = string<br>    filter             = string<br>    alignment_period   = string<br>    per_series_aligner = string<br>    trigger_count      = number<br>  }))</pre> | n/a | yes |
| <a name="input_emails"></a> [emails](#input\_emails) | A list of email addresses to send notifications to. | `list(string)` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The ID of the project where the alert policies will be created. | `string` | n/a | yes |
<!-- END_TF_DOCS -->