variable "docker_repository_ids" {
  default     = []
  type        = set(string)
  description = "List of repository ids to create"
}

variable "location" {
  default     = "europe-west2"
  type        = string
  description = "The name of the location this repository is located in"
}

variable "project_id" {
  type        = string
  description = "Project id where service account will be created"
}
