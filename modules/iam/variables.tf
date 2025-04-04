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

variable "additional_api_roles" {
  description = "List of additional API roles"
  type        = list(string)
  default     = []
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

variable "generate_gitlab_ci_keys" {
  description = "Whether to generate keys for gitlab CI service account"
  type        = bool
  default     = false
}

variable "generate_gitlab_cd_keys" {
  description = "Whether to generate keys for gitlab CD service account"
  type        = bool
  default     = false
}

variable "additional_gitlab_ci_roles" {
  description = "List of additional roles for Gitlab CI runner"
  type        = list(string)
  default     = []
}

variable "additional_gitlab_cd_roles" {
  description = "List of additional roles for Gitlab CD runner"
  type        = list(string)
  default     = []
}
