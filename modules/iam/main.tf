module "gitlab" {
  source        = "terraform-google-modules/service-accounts/google"
  version       = "~>4.2.1"
  project_id    = var.project_id
  names         = ["gitlab"]
  description   = "Service account for Gitlab CI/CD"
  generate_keys = true
  project_roles = ["${var.project_id}=>roles/editor"]
  count         = var.create_single_gitlab_account ? 1 : 0
}

module "api" {
  source        = "terraform-google-modules/service-accounts/google"
  version       = "~>4.2.1"
  project_id    = var.project_id
  names         = [var.api_serviceaccount_name]
  description   = "Service account for API"
  generate_keys = var.generate_api_keys
  project_roles = concat(
    ["${var.project_id}=>roles/storage.admin"],
    formatlist("${var.project_id}=>%s", var.additional_api_roles)
  )
}

module "gitlab_runner_ci" {
  source        = "terraform-google-modules/service-accounts/google"
  version       = "~>4.2.1"
  project_id    = var.project_id
  names         = ["gitlab"]
  description   = "Service account for Gitlab CI"
  generate_keys = var.generate_gitlab_ci_keys
  project_roles = concat(
    ["${var.project_id}=>roles/artifactregistry.admin"],
    formatlist("${var.project_id}=>%s", var.additional_gitlab_ci_roles)
  )
  count = var.create_single_gitlab_account ? 0 : 1
}

module "gitlab_runner_cd" {
  source        = "terraform-google-modules/service-accounts/google"
  version       = "~>4.2.1"
  project_id    = var.project_id
  names         = ["gitlab"]
  description   = "Service account for Gitlab CD"
  generate_keys = var.generate_gitlab_cd_keys
  project_roles = concat(
    ["${var.project_id}=>roles/roles/container.admin"],
    formatlist("${var.project_id}=>%s", var.additional_gitlab_cd_roles)
  )
  count = var.create_single_gitlab_account ? 0 : 1
}

module "additional_service_accounts" {
  for_each      = { for account in var.additional_service_accounts : account.name => account }
  source        = "terraform-google-modules/service-accounts/google"
  version       = "~>4.2.1"
  project_id    = var.project_id
  names         = [each.value.name]
  description   = each.value.description
  generate_keys = each.value.generate_keys
  project_roles = [for item in each.value.project_roles : "${var.project_id}=>${item}"]
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
    "roles/monitoring.viewer",
    "roles/firebase.viewer",
    "roles/serviceusage.apiKeysViewer",
  ]
  permissions = [
    "container.clusters.get",
    "storage.buckets.list",
    "cloudsql.instances.connect",
  ]
  excluded_permissions = [
    "resourcemanager.projects.list"
  ]
  members = var.developer_members
}
