data "google_service_account_access_token" "default" {
  target_service_account = var.service_account_email 
  scopes                 = ["userinfo-email", "cloud-platform"]
  lifetime               = "300s"
}

provider "google-beta" {
  alias        = "impersonated"
  access_token = data.google_service_account_access_token.default.access_token
}

data "google_client_openid_userinfo" "impersonated" {
  provider = google-beta.impersonated
}
