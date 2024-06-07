module "auth" {
  count = var.service_name == "auth" ? 1 : 0

  source = "./service"

  service_namespace = var.service_namespace
  service_name      = var.service_name
  service_version   = var.service_version
  service_port      = var.service_port
  image             = var.image
}
