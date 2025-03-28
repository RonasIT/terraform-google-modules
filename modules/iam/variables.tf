variable "project_id" {
  description = "Project id where service account will be created"
  type        = string
}

variable "teamlead_members" {
  description = "List of members for teamlead role"
  type        = list(string)
  default     = []
}

variable "developer_members" {
  description = "List of members for developer role"
  type        = list(string)
  default     = []
}

variable "additional_service_accounts" {
  description = "Additional service accounts"
  type = list(object({
    name          = string
    description   = string
    generate_keys = bool
    project_roles = list(string)
  }))
  default = []
}

variable "api_serviceaccount_name" {
  description = "name for API Service Account"
  type        = string
}

variable "api_serviceaccount_roles" {
  description = "list of roles for API Service Account"
  type        = list(string)
}

variable "create_single_gitlab_account" {
  description = "Whether to create single gitlab service account"
  type        = bool
  default     = false
}
