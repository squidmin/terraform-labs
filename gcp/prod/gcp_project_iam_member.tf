/* [START] GCP project IAM member */
resource "google_project_iam_member" "run_admin" {
  project = var.project_id
  role    = "roles/run.admin"
  member  = "serviceAccount:${google_service_account.gh_actions_pipeline.email}"
}

resource "google_project_iam_member" "artifact_registry_admin" {
  project = var.project_id
  role    = "roles/artifactregistry.admin"
  member  = "serviceAccount:${google_service_account.gh_actions_pipeline.email}"
}

resource "google_project_iam_member" "artifact_registry_user" {
  project = var.project_id
  role    = "roles/artifactregistry.admin"
  member  = "user:${var.project_admin_user_email}"
}

#resource "google_project_iam_member" "gh_actions_pipeline_service_account_user" {
#  project = var.project_id
#  role    = "roles/iam.serviceAccountUser"
#  member  = "serviceAccount:${google_service_account.gh_actions_pipeline.email}"
#}

resource "google_project_iam_member" "gh_actions_pipeline_push_to_artifact_registry" {
  project = var.project_id
  role    = "roles/artifactregistry.writer"
  member  = "serviceAccount:${google_service_account.gh_actions_pipeline.email}"
}
/* [END] GCP project IAM member */
