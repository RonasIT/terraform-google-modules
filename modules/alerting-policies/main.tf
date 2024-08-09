resource "google_monitoring_alert_policy" "alert_policies" {
  count = length(var.alerting_types)

  project = var.project_id

  display_name = "${var.alerting_types[count.index]} alert policy"
  combiner     = "OR"

  conditions {
    display_name = "${var.alerting_types[count.index]} condition"
    condition_threshold {
      filter          = "metric.type=\"${var.alerting_types[count.index]}\" AND resource.type=\"${var.alerting_types[count.index] == "pubsub.googleapis.com/subscription/oldest_unacked_message_age" ? "pubsub_subscription" : "gce_instance"}\""
      duration        = var.durations[var.alerting_types[count.index]]
      comparison      = "COMPARISON_GT"
      threshold_value = var.thresholds[var.alerting_types[count.index]]

      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_MEAN"
      }
    }
  }
  notification_channels = [for email in var.emails : google_monitoring_notification_channel.email_channels[email].name]
}



resource "google_monitoring_notification_channel" "email_channels" {
  for_each = toset(var.emails)

  project = var.project_id

  display_name = "Email Channel - ${each.value}"
  type         = "email"
  labels = {
    email_address = each.value
  }
}
