resource "google_monitoring_alert_policy" "cpu_utilization_alert_policy" {
  count = length(var.alert_policies)

  project = var.project_id

  display_name = var.alert_policies[count.index].display_name
  combiner     = "OR"

  conditions {
    display_name = "${var.alert_policies[count.index].display_name} condition"
    condition_threshold {
      filter          = var.alert_policies[count.index].filter
      duration        = var.alert_policies[count.index].duration
      comparison      = var.alert_policies[count.index].comparison
      threshold_value = var.alert_policies[count.index].threshold
      trigger {
        count = var.alert_policies[count.index].trigger_count
      }
      aggregations {
        alignment_period   = var.alert_policies[count.index].alignment_period
        per_series_aligner = var.alert_policies[count.index].per_series_aligner
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
