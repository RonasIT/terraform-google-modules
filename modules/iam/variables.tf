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
  default     = "api"
}

variable "api_roles" {
  description = "List of roles for API service account (can be fully overridden)"
  type        = list(string)
  default     = ["roles/storage.admin"]
}

variable "generate_api_keys" {
  description = "Whether to generate keys for gitlab CD service account"
  type        = bool
  default     = false
}

variable "create_single_gitlab_account" {
  description = "Whether to create single gitlab service account"
  type        = bool
  default     = false
}

variable "gitlab_roles" {
  description = "List of roles for single Gitlab service account (can be fully overridden)"
  type        = list(string)
  default     = ["roles/editor"]
}

variable "generate_gitlab_ci_keys" {
  description = "Whether to generate keys for gitlab CI service account"
  type        = bool
  default     = false
}

variable "gitlab_ci_roles" {
  description = "List of roles for Gitlab CI runner (can be fully overridden)"
  type        = list(string)
  default     = ["roles/artifactregistry.admin"]
}

variable "generate_gitlab_cd_keys" {
  description = "Whether to generate keys for gitlab CD service account"
  type        = bool
  default     = false
}

variable "gitlab_cd_roles" {
  description = "List of roles for Gitlab CD runner (can be fully overridden)"
  type        = list(string)
  default     = ["roles/container.admin"]
}
