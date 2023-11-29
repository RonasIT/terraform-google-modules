variable "project_id" {
  description = "The ID of the project"
  type        = string
}

variable "service_account_email" {
  description = "The service account name to impersonate (must have roles/serviceusage.apiKeysAdmin)"
  type        = string
}

variable "gcp_service_list" {
  description = "The list of apis necessary for the project"
  default = {
    places    = "places-backend.googleapis.com",
    geocoding = "geocoding-backend.googleapis.com",
  }
}


