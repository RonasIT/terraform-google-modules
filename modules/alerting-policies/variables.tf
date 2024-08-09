variable "alert_policies" {
  description = "A list of alert policies, each containing conditions, thresholds, durations, and other settings."
  type = list(object({
    display_name       = string
    metric_type        = string
    resource_type      = string
    filter_labels      = map(string)
    threshold          = number
    duration           = string
    comparison         = string
    alignment_period   = string
    per_series_aligner = string
  }))
}

variable "project_id" {
  description = "The ID of the project where the alert policies will be created."
  type        = string
}

variable "emails" {
  description = "A list of email addresses to send notifications to."
  type        = list(string)
}

variable "region" {
  description = "The region or zone where the resources are located."
  type        = string
}
