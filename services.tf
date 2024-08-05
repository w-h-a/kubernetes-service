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
  enable_tls         = var.enable_tls
  cert_provider      = var.cert_provider
  hosts              = var.hosts
}

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

module "streams" {
  count = var.service_name == "streams" ? 1 : 0

  source = "./service"

  resource_namespace = var.resource_namespace
  app_namespace      = var.app_namespace
  service_namespace  = var.service_namespace
  service_name       = var.service_name
  service_version    = var.service_version
  service_port       = var.service_port
  service_image      = var.service_image
  image_pull_policy  = var.image_pull_policy
}

module "cronjobs" {
  count = var.service_name == "cronjobs" ? 1 : 0

  source = "./service"

  resource_namespace = var.resource_namespace
  app_namespace      = var.app_namespace
  service_namespace  = var.service_namespace
  service_name       = var.service_name
  service_version    = var.service_version
  service_port       = var.service_port
  service_image      = var.service_image
  image_pull_policy  = var.image_pull_policy
}

module "store" {
  count = var.service_name == "store" ? 1 : 0

  source = "./service"

  resource_namespace    = var.resource_namespace
  app_namespace         = var.app_namespace
  service_namespace     = var.service_namespace
  service_name          = var.service_name
  service_version       = var.service_version
  service_port          = var.service_port
  service_image         = var.service_image
  image_pull_policy     = var.image_pull_policy
  aws_access_key        = var.aws_access_key
  aws_secret_access_key = var.aws_secret_access_key
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
  enable_tls         = var.enable_tls
  cert_provider      = var.cert_provider
  hosts              = var.hosts
}

module "tickets" {
  count = var.service_name == "tickets" ? 1 : 0

  source = "./service"

  resource_namespace = var.resource_namespace
  app_namespace      = var.app_namespace
  service_namespace  = var.service_namespace
  service_name       = var.service_name
  service_version    = var.service_version
  service_port       = var.service_port
  service_image      = var.service_image
  image_pull_policy  = var.image_pull_policy
}

module "orders" {
  count = var.service_name == "orders" ? 1 : 0

  source = "./service"

  resource_namespace = var.resource_namespace
  app_namespace      = var.app_namespace
  service_namespace  = var.service_namespace
  service_name       = var.service_name
  service_version    = var.service_version
  service_port       = var.service_port
  service_image      = var.service_image
  image_pull_policy  = var.image_pull_policy
}

module "payments" {
  count = var.service_name == "payments" ? 1 : 0

  source = "./service"

  resource_namespace = var.resource_namespace
  app_namespace      = var.app_namespace
  service_namespace  = var.service_namespace
  service_name       = var.service_name
  service_version    = var.service_version
  service_port       = var.service_port
  service_image      = var.service_image
  image_pull_policy  = var.image_pull_policy
  payment_key        = var.payment_key
}
