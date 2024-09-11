variable "project_id" {
  description = "The ID of the project where the alert policies will be created."
  type        = string
}

variable "alert_policies" {
  description = "A list of alert policies for log-based metrics, each containing conditions, thresholds, durations, and other settings."
  type = list(object({
    display_name       = string
    metric_type        = string
    threshold          = number
    duration           = string
    comparison         = string
    filter             = string
    alignment_period   = string
    per_series_aligner = string
    trigger_count      = number
  }))
}

variable "emails" {
  description = "A list of email addresses to send notifications to."
  type        = list(string)
}
