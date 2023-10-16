data "google_client_config" "this" {}

provider "helm" {
  kubernetes {
    host                   = "https://${var.endpoint}"
    token                  = data.google_client_config.this.access_token
    cluster_ca_certificate = base64decode("${var.ca_certificate}")
  }
}