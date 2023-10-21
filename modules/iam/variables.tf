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
