resource "google_project_service" "apikeys" {
  project = var.project_id
  service = "apikeys.googleapis.com"
}

resource "google_project_service" "apis" {
  for_each                   = var.gcp_service_list
  project                    = var.project_id
  service                    = each.value
  disable_dependent_services = false
  depends_on = [
    google_project_service.apikeys
  ]
}

resource "google_apikeys_key" "api_keys" {
  for_each     = var.gcp_service_list
  name         = "${each.key}-key"
  display_name = "${title(each.key)} API key (Managed by Terraform)"
  project      = var.project_id
  provider     = google-beta.impersonated
  restrictions {
    api_targets {
      service = each.value
    }
  }
  depends_on = [
    google_project_service.apis
  ]
}

