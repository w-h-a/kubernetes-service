module "auth" {
  count = var.service_name == "auth" ? 1 : 0

  source = "./service"

  resource_namespace = var.resource_namespace
  app_namespace      = var.app_namespace
  service_namespace  = var.service_namespace
  service_name       = var.service_name
  service_version    = var.service_version
  service_port       = var.service_port
  service_image      = var.service_image
  image_pull_policy  = var.image_pull_policy
  admin              = var.admin
  secret             = var.secret
}

module "admin" {
  count = var.service_name == "admin" ? 1 : 0

  source = "./service"

  resource_namespace = var.resource_namespace
  app_namespace      = var.app_namespace
  service_namespace  = var.service_namespace
  service_name       = var.service_name
  service_version    = var.service_version
  k8s_service_type   = var.service_type
  service_port       = var.service_port
  node_port          = var.node_port
  service_image      = var.service_image
  image_pull_policy  = var.image_pull_policy
}

module "webtix" {
  count = var.service_name == "webtix" ? 1 : 0

  source = "./service"

  resource_namespace = var.resource_namespace
  app_namespace      = var.app_namespace
  service_namespace  = var.service_namespace
  service_name       = var.service_name
  service_version    = var.service_version
  k8s_service_type   = var.service_type
  service_port       = var.service_port
  node_port          = var.node_port
  service_image      = var.service_image
  image_pull_policy  = var.image_pull_policy
}
