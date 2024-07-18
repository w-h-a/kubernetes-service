locals {
  common_labels = {
    "namespace" = var.service_namespace
    "name"      = var.service_name
    "version"   = var.service_version
  }

  common_annotations = {

  }

  common_env_vars = {
    "RESOURCE_NAMESPACE"  = var.resource_namespace
    "APP_NAMESPACE"       = var.app_namespace
    "NAMESPACE"           = var.service_namespace
    "NAME"                = var.service_name
    "VERSION"             = var.service_version
    "ADDRESS"             = ":${var.service_port}"
    "COCKROACHDB_ADDRESS" = "postgres://root@cockroachdb-public.${var.resource_namespace}:26257/?sslmode=disable"
    "ADMIN"               = var.admin
    "SECRET"              = var.secret
    "PAYMENT_KEY"         = var.payment_key
  }
}

resource "kubernetes_deployment" "network_deployment" {
  metadata {
    namespace = var.service_namespace
    name      = var.service_name
    labels    = merge(local.common_labels, var.extra_labels)
  }

  spec {
    replicas = var.service_replicas

    selector {
      match_labels = merge(local.common_labels, var.extra_labels)
    }

    template {
      metadata {
        labels = merge(local.common_labels, var.extra_labels)
      }

      spec {
        container {
          name              = var.service_name
          args              = split("-", var.service_name)
          image             = "${var.service_image}:${var.service_version}"
          image_pull_policy = var.image_pull_policy

          port {
            name           = "${var.service_name}-port"
            container_port = var.service_port
            protocol       = var.service_protocol
          }

          dynamic "env" {
            for_each = merge(local.common_env_vars, var.extra_env_vars)

            content {
              name  = env.key
              value = env.value
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "k8s_service" {
  count = var.create_k8s_service ? 1 : 0

  metadata {
    namespace = var.service_namespace
    name      = var.service_name
    labels    = merge(local.common_labels, var.extra_labels)
  }

  spec {
    type = var.k8s_service_type

    port {
      name        = "${var.service_name}-port"
      port        = var.service_port
      protocol    = var.service_protocol
      target_port = "${var.service_name}-port"
      node_port   = var.node_port != -1 ? var.node_port : 0
    }

    selector = merge(local.common_labels, var.extra_labels)
  }
}
