/* [START] Google project IAM binding */
resource "google_project_iam_binding" "gh_actions_pipeline_container_developer" {
  project = var.project_id
  role    = "roles/container.developer"

  members = [
    "serviceAccount:${var.gh_actions_pipeline_service_account_email}",
  ]
}

resource "google_project_iam_binding" "gh_actions_pipeline_cluster_admin" {
  project = var.project_id
  role    = "roles/container.clusterAdmin"

  members = [
    "serviceAccount:${var.gh_actions_pipeline_service_account_email}",
  ]
}

resource "google_project_iam_binding" "gh_actions_pipeline_service_account_user" {
  project = var.project_id
  role    = "roles/iam.serviceAccountUser"

  members = [
    "serviceAccount:${var.gh_actions_pipeline_service_account_email}",
  ]
}

resource "google_project_iam_binding" "discord_app_server_sa_roles" {
  project = var.project_id
  role    = "roles/run.admin"

  members = [
    "serviceAccount:${google_service_account.discord_app_server_sa.email}"
  ]
}

resource "google_project_iam_binding" "discord_app_server_artifact_registry_roles" {
  project = var.project_id
  role    = "roles/artifactregistry.admin"

  members = [
    "serviceAccount:${google_service_account.discord_app_server_sa.email}",
  ]
}

resource "google_project_iam_binding" "discord_app_server_storage_admin_roles" {
  project = var.project_id
  role    = "roles/storage.admin"

  members = [
    "serviceAccount:${google_service_account.discord_app_server_sa.email}"
  ]
}

resource "google_project_iam_binding" "terraform_prod_artifact_registry_admin" {
  project = var.project_id
  role    = "roles/artifactregistry.admin"

  members = [
    "serviceAccount:${google_service_account.terraform_prod_sa.email}"
  ]
}
/* [END] Google project IAM binding */
