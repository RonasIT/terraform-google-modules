variable "project_id" {
  description = "The project ID to deploy the resources in."
  type        = string
}

variable "region" {
  description = "The region where the static IPs will be created."
  type        = string
}

variable "zone" {
  description = "The zone where the instances will be deployed."
  type        = string
}

variable "vms" {
  description = "A list of objects defining the VMs to create."
  type = list(object({
    name             = string
    machine_type     = string
    disk_size_gb     = number
    disk_type        = string
    source_image     = string
    assign_static_ip = bool
    static_ip_name   = optional(string)
    startup_script   = string
    ssh_keys = optional(list(object({
      user = string
      key  = string
    })), [])
    ingress_rules = optional(list(object({
      protocol      = string
      ports         = list(string)
      source_ranges = list(string)
    })), [])
    egress_rules = optional(list(object({
      protocol           = string
      ports              = list(string)
      destination_ranges = list(string)
    })), [])
  }))

  validation {
    condition = alltrue([
      for vm in var.vms : can(regex("^[a-z][-a-z0-9]*[a-z0-9]$", vm.name))
    ])
    error_message = "VM names must start with a lowercase letter, end with a lowercase letter or number, and contain only lowercase letters, numbers, and hyphens."
  }

  validation {
    condition = alltrue([
      for vm in var.vms : vm.disk_size_gb >= 10 && vm.disk_size_gb <= 65536
    ])
    error_message = "Disk size must be between 10 GB and 65536 GB."
  }

  validation {
    condition = alltrue([
      for vm in var.vms : contains(["pd-standard", "pd-ssd", "pd-balanced"], vm.disk_type)
    ])
    error_message = "Disk type must be one of: pd-standard, pd-ssd, pd-balanced."
  }

  validation {
    condition = alltrue([
      for vm in var.vms : !vm.assign_static_ip || (vm.assign_static_ip && vm.static_ip_name != null && vm.static_ip_name != "")
    ])
    error_message = "static_ip_name must be provided when assign_static_ip is true."
  }

  validation {
    condition = alltrue([
      for vm in var.vms : length(vm.name) <= 63
    ])
    error_message = "VM names must be 63 characters or less."
  }

  validation {
    condition     = length(var.vms) == length(distinct([for vm in var.vms : vm.name]))
    error_message = "All VM names must be unique."
  }
}

variable "network" {
  description = "The network to deploy the instances in."
  type        = string
}

variable "subnetwork_self_link" {
  description = "The self-link of the subnetwork to use."
  type        = string
}

variable "network_tag" {
  description = "Tag used to identify the VM instances for firewall rules."
  type        = string
  default     = "vms"

  validation {
    condition     = can(regex("^[a-z][-a-z0-9]*[a-z0-9]$", var.network_tag))
    error_message = "Network tag must start with a lowercase letter and contain only lowercase letters, numbers, and hyphens."
  }
}

variable "service_account_email" {
  description = "Email of the service account to attach to the VMs."
  type        = string
}

variable "ssh_keys" {
  description = "Global SSH keys to add to all VMs (unless overridden by per-VM keys)"
  type = list(object({
    user = string
    key  = string
  }))
  default = []
}

variable "default_ssh_user" {
  description = "Default SSH user for backward compatibility when using ssh_public_keys"
  type        = string
  default     = "ubuntu"
}

variable "ssh_public_keys" {
  description = "List of SSH public keys to add to all VMs with default user (backward compatibility)"
  type        = list(string)
  default     = []
}

variable "labels" {
  description = "Labels to apply to all resources created by this module"
  type        = map(string)
  default     = {}

  validation {
    condition = alltrue([
      for k, v in var.labels : can(regex("^[a-z0-9_-]{1,63}$", k))
    ])
    error_message = "Label keys must be lowercase alphanumeric characters, underscores, or hyphens, and 1-63 characters long."
  }

  validation {
    condition = alltrue([
      for k, v in var.labels : can(regex("^[a-z0-9_-]{0,63}$", v))
    ])
    error_message = "Label values must be lowercase alphanumeric characters, underscores, or hyphens, and 0-63 characters long."
  }
}
