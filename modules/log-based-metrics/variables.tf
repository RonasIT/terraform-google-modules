variable "project_id" {
  description = "The ID of the project where the log metric will be created."
  type        = string
}

variable "metrics" {
  description = "A list of log-based metrics configurations."
  type = list(object({
    metric_name        = string
    metric_description = string
    filter             = string
    metric_kind        = string
    value_type         = string
    value_extractor    = string
    label_extractors   = map(string)
  }))
}
