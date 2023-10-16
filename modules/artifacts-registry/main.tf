resource "google_artifact_registry_repository" "docker_repository" {
  for_each               = toset(var.docker_repository_ids)
  project                = var.project_id
  provider               = google-beta
  location               = "europe-west2"
  repository_id          = each.value
  description            = "Managed by Terraform"
  format                 = "DOCKER"
  cleanup_policy_dry_run = false
  cleanup_policies {
    id     = "delete-prerelease"
    action = "DELETE"
    condition {
      tag_state    = "TAGGED"
      tag_prefixes = ["v"]
      older_than   = "2592000s"
    }
  }
  cleanup_policies {
    id     = "keep-tagged-release"
    action = "KEEP"
    condition {
      tag_state    = "TAGGED"
      tag_prefixes = ["development", "staging", "production"]
    }
  }
  cleanup_policies {
    id     = "keep-minimum-versions"
    action = "KEEP"
    most_recent_versions {
      keep_count = 10
    }
  }
}
