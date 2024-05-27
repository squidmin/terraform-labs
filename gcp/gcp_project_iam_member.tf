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

resource "google_project_iam_member" "itera_backend_run_admin" {
  project = var.project_id
  role    = "roles/run.admin"
  member  = "serviceAccount:${google_service_account.itera_backend_sa.email}"
}

resource "google_project_iam_member" "itera_backend_artifact_registry_admin" {
  project = var.project_id
  role    = "roles/artifactregistry.admin"
  member  = "serviceAccount:${google_service_account.itera_backend_sa.email}"
}

resource "google_project_iam_member" "artifact_registry_user" {
  project = var.project_id
  role    = "roles/artifactregistry.admin"
  member  = "user:${var.project_admin_user_email}"
}

resource "google_project_iam_member" "gh_actions_pipeline_service_account_user" {
  project = var.project_id
  role    = "roles/iam.serviceAccountUser"
  member  = "serviceAccount:${google_service_account.gh_actions_pipeline.email}"
}

resource "google_project_iam_member" "gh_actions_pipeline_push_to_artifact_registry" {
  project = var.project_id
  role    = "roles/artifactregistry.writer"
  member  = "serviceAccount:${google_service_account.gh_actions_pipeline.email}"
}

resource "google_project_iam_member" "itera_backend_service_account_user" {
  project = var.project_id
  role    = "roles/iam.serviceAccountUser"
  member  = "serviceAccount:${google_service_account.itera_backend_sa.email}"
}

resource "google_project_iam_member" "itera_backend_push_to_artifact_registry" {
  project = var.project_id
  role    = "roles/artifactregistry.writer"
  member  = "serviceAccount:${google_service_account.itera_backend_sa.email}"
}

resource "google_project_iam_member" "gemini_api_backend_service_account_user" {
  project = var.project_id
  role    = "roles/iam.serviceAccountUser"
  member  = "serviceAccount:${google_service_account.gemini_api_backend_sa.email}"
}

resource "google_project_iam_member" "signed_url_generator_sa_storage_object_viewer" {
  project = var.project_id
  role    = "roles/storage.objectViewer"
  member  = "serviceAccount:${google_service_account.signed_url_generator_sa.email}"
}

resource "google_project_iam_member" "signed_url_generator_sa_token_creator" {
  project = var.project_id
  role    = "roles/iam.serviceAccountTokenCreator"
  member  = "serviceAccount:${google_service_account.signed_url_generator_sa.email}"
}

resource "google_project_iam_member" "itera_backend_gke_developer" {
  project = var.project_id
  role    = "roles/container.developer"
  member  = "serviceAccount:${var.itera_backend_service_account_email}"
}

resource "google_project_iam_member" "itera_backend_artifact_registry_reader" {
  project = var.project_id
  role    = "roles/artifactregistry.reader"
  member  = "serviceAccount:${var.itera_backend_service_account_email}"
}

resource "google_project_iam_member" "itera_backend_service_account_token_creator" {
  project = var.project_id
  role    = "roles/iam.serviceAccountTokenCreator"
  member  = "serviceAccount:${var.itera_backend_service_account_email}"
}
/* [END] GCP project IAM member */
