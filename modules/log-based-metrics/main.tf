resource "google_logging_metric" "log_metric" {
  for_each = { for metric in var.metrics : metric.metric_name => metric }

  project     = var.project_id
  name        = each.value.metric_name
  description = each.value.metric_description
  filter      = each.value.filter

  metric_descriptor {
    metric_kind = each.value.metric_kind
    value_type  = each.value.value_type

    dynamic "labels" {
      for_each = each.value.label_extractors
      content {
        key         = labels.key
        value_type  = "STRING"
        description = "Extracted label"
      }
    }
  }

  value_extractor = each.value.value_extractor
}
