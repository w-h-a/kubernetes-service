module "auth" {
  count = var.service_name == "auth" ? 1 : 0

  source = "./service"

  resource_namespace = var.resource_namespace
  service_namespace  = var.service_namespace
  service_name       = var.service_name
  service_version    = var.service_version
  service_port       = var.service_port
  service_image      = var.service_image
  image_pull_policy  = var.image_pull_policy
}
