variable "project_id" {
  description = "The ID of the project where the alert policies will be created."
  type        = string
}

variable "alerting_types" {
  description = "A list of metric types to create alert policies for."
  type        = list(string)
}

variable "thresholds" {
  description = "A map where each key is a metric type and the value is the threshold for the alert."
  type        = map(number)
}

variable "durations" {
  description = "A map where each key is a metric type and the value is the duration for the alert."
  type        = map(string)
}

variable "region" {
  description = "The region or zone where the resources are located."
  type        = string
}

variable "emails" {
  description = "A list of email addresses to send notifications to."
  type        = list(string)
}
