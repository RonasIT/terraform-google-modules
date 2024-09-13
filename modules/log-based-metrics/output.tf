output "metric_ids" {
  description = "IDs of the log-based metrics"
  value       = { for name, metric in google_logging_metric.log_metric : name => metric.id }
}
