variable "service_namespace" {
  description = "The service's namespace"
  type        = string
}

variable "service_name" {
  description = "The service's name"
  type        = string
}

variable "service_version" {
  description = "The service's version"
  type        = string
}

variable "service_port" {
  description = "The service's port"
  type        = number
  default     = -1
}

variable "service_image" {
  description = "The service's base repo/image name"
  type        = string
}

variable "image_pull_policy" {
  description = "K8s image pull policy"
  type        = string
}
