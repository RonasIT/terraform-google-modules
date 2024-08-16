output "metric_name" {
  value       = google_logging_metric.log_metric.id
  description = "ID of metric that was a created "
  sensitive   = false
}
