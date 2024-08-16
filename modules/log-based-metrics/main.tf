resource "google_logging_metric" "log_metric" {
  project     = var.project_id
  name        = var.metric_name
  description = var.metric_description
  filter      = var.filter

  metric_descriptor {
    metric_kind = var.metric_kind
    value_type  = var.value_type

    dynamic "labels" {
      for_each = var.label_extractors
      content {
        key         = labels.key
        value_type  = "STRING"
        description = "Extracted label"
      }
    }
  }


  value_extractor = var.value_extractor
}
