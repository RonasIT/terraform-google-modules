resource "google_compute_address" "this" {
  project = var.project_id
  region  = var.region
  name    = "${var.prefix}-nginx-controller"
}

module "nginx-controller" {
  source           = "terraform-iaac/nginx-controller/helm"
  version          = "~>2.3.0"
  ip_address       = google_compute_address.this.address
  chart_version    = var.chart_version
  namespace        = var.namespace
  create_namespace = var.create_namespace
  controller_kind  = var.controller_kind
  name             = var.namespace
  atomic           = var.atomic
  additional_set = concat(var.additional_set, [
    {
      name  = "cert-manager\\.io/cluster-issuer"
      value = var.cluster_issuer_name
      type  = "string"
    },
    {
      name  = "controller.config.use-forwarded-headers",
      value = "true"
      type  = "string"
    },
  ])
}
