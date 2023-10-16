variable "project_id" {
  description = "Project id where service account will be created"
}

variable "teamlead_members" {
  description = "List of members for devops role"
  type        = list(string)
  default     = []
}

variable "developer_members" {
  description = "List of members for developer role"
  type        = list(string)
  default     = []
}
