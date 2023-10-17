module "gitlab" {
  source        = "terraform-google-modules/service-accounts/google"
  version       = "~>4.2.1"
  project_id    = var.project_id
  names         = ["gitlab"]
  description   = "Service account for Gitlab CI/CD"
  generate_keys = true
  project_roles = ["${var.project_id}=>roles/editor"]
}

module "storage" {
  source        = "terraform-google-modules/service-accounts/google"
  version       = "~>4.2.1"
  project_id    = var.project_id
  names         = ["storage"]
  description   = "Service account for managing storage buckets"
  generate_keys = true
  project_roles = ["${var.project_id}=>roles/storage.admin"]
}


module "teamlead" {
  source   = "terraform-google-modules/iam/google//modules/projects_iam"
  version  = "~> 7.7.0"
  projects = [var.project_id]
  bindings = {
    "roles/editor" = var.teamlead_members
  }
}

module "developer" {
  source       = "terraform-google-modules/iam/google//modules/custom_role_iam"
  version      = "~>7.7.0"
  target_level = "project"
  target_id    = var.project_id
  role_id      = "developer"
  title        = "Developer"
  description  = "Developer custom role"
  base_roles = [
    "roles/container.developer",
    "roles/storage.objectViewer",
    "roles/cloudsql.viewer",
    "roles/run.viewer",
    "roles/cloudfunctions.viewer",
    "roles/cloudfunctions.invoker",
    "roles/pubsub.viewer",
  ]
  permissions = [
    "container.clusters.get",
    "storage.buckets.list",
    "cloudsql.instances.connect",
  ]
  excluded_permissions = [
    "resourcemanager.projects.get",
    "resourcemanager.projects.list"
  ]
  members = var.developer_members
}
