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

variable "service_replicas" {
  description = "The number of replicas"
  type        = number
  default     = 1
}

variable "create_k8s_service" {
  description = "Whether to create a k8s service"
  type        = bool
  default     = true
}

variable "k8s_service_type" {
  description = "K8s service type"
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

variable "service_protocol" {
  description = "The service's protocol"
  type        = string
  default     = "TCP"
}

variable "extra_labels" {
  description = "Additional k8s labels"
  type        = map(string)
  default     = {}
}

variable "extra_annotations" {
  description = "Additional k8s annotations"
  type        = map(string)
  default     = {}
}

variable "extra_env_vars" {
  description = "Additional env vars"
  type        = map(string)
  default     = {}
}

variable "service_image" {
  description = "The service's image"
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

variable "payment_key" {
  description = "payment secret"
  type        = string
  default     = ""
}

variable "enable_tls" {
  description = "enable tls"
  type        = string
  default     = "false"
}

variable "cert_provider" {
  description = "cert provider"
  type        = string
  default     = ""
}

variable "hosts" {
  description = "comma separated list of hosts"
  type        = string
  default     = ""
}
