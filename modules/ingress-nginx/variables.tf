variable "prefix" {
  type        = string
  description = "Prefix for all resources"
}

variable "region" {
  type        = string
  default     = ""
  description = "The region of the Kubernetes cluster"
}

variable "project_id" {
  type        = string
  description = "The project ID to deploy"
}

variable "name" {
  type        = string
  description = "Name of helm release"
  default     = "ingress-nginx"
}
variable "namespace" {
  type        = string
  description = "Name of namespace where nginx controller should be deployed"
  default     = "ingress-nginx"
}

variable "create_namespace" {
  type        = bool
  description = "Create a namespace"
  default     = true
}

variable "atomic" {
  type        = bool
  description = "If set, installation process purges chart on fail"
  default     = true
}

variable "controller_kind" {
  type        = string
  description = "Controller type: DaemonSet, Deployment etc.."
  default     = "DaemonSet"
}

variable "endpoint" {
  type        = string
  description = "The endpoint of the Kubernetes cluster"
}

variable "ca_certificate" {
  type        = string
  description = "The CA certificate of the Kubernetes cluster"
}

variable "additional_set" {
  description = "Optional set for additional helm settings"
  default = [
    {
      name  = "controller.resources.limits.cpu"
      value = "125m"
      type  = "string"
    },
    {
      name  = "controller.resources.limits.memory"
      value = "175Mi"
      type  = "string"
    },
    {
      name  = "controller.config.proxy-body-size",
      value = "100m"
      type  = "string"
    },
    {
      name  = "controller.addHeaders.x-robots-tag"
      value = "noindex"
      type  = "string"
    }
  ]
  type = list(
    object(
      {
        name  = string
        value = string
        type  = optional(string)
      }
    )
  )
}

variable "cluster_issuer_name" {
  type        = string
  description = "The name of the cluster issuer (CertManager)"
}
variable "chart_version" {
  type        = string
  description = "The version of Helm chart"
  default     = "4.13"
}
