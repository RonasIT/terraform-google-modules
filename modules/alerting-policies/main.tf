resource "google_monitoring_alert_policy" "alert_policies" {
  count = length(var.alert_policies)

  project = var.project_id

  display_name = var.alert_policies[count.index].display_name
  combiner     = "OR"

  conditions {
    display_name = "${var.alert_policies[count.index].display_name} condition"
    condition_threshold {
      filter = join(" AND ", flatten([
        "metric.type=\"${var.alert_policies[count.index].metric_type}\"",
        "resource.type=\"${var.alert_policies[count.index].resource_type}\"",
        [for k, v in var.alert_policies[count.index].filter_labels : "resource.label.${k}=\"${v}\""]
      ]))

      duration        = var.alert_policies[count.index].duration
      comparison      = var.alert_policies[count.index].comparison
      threshold_value = var.alert_policies[count.index].threshold

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
