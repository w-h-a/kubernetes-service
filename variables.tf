variable "resource_namespace" {
  description = "The namespace for shared resources"
  type        = string
}

variable "app_namespace" {
  description = "The namespace of the app"
  type        = string
}

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

variable "service_type" {
  description = "The type of service (e.g., cluster IP, load balancer, node port)"
  type        = string
  default     = "ClusterIP"
}

variable "service_port" {
  description = "The service's port"
  type        = number
  default     = -1
}

variable "node_port" {
  description = "The node port"
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

variable "admin" {
  description = "admin id"
  type        = string
  default     = ""
}

variable "secret" {
  description = "admin secret"
  type        = string
  default     = ""
}
