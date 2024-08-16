variable "project_id" {
  description = "The ID of the project where the log metric will be created."
  type        = string
}

variable "metric_name" {
  description = "The name of the log-based metric."
  type        = string
}

variable "metric_description" {
  description = "A description of the log-based metric."
  type        = string
}

variable "filter" {
  description = "The filter expression for the log-based metric."
  type        = string
}

variable "metric_kind" {
  description = "The type of metric, either DELTA, GAUGE, or CUMULATIVE."
  type        = string
  default     = "DELTA"
}

variable "value_type" {
  description = "The type of value the metric collects, such as BOOL, INT64, DOUBLE, STRING, or DISTRIBUTION."
  type        = string
  default     = "INT64"
}

variable "value_extractor" {
  description = "A value extraction expression for the log-based metric."
  type        = string
  default     = null
}

variable "label_extractors" {
  description = "A map of label extractors where the key is the label name and the value is the extractor expression."
  type        = map(string)
  default     = {}
}
