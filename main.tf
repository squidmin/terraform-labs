/* [START] GCP storage bucket */
resource "google_storage_bucket" "amphi_static_content_bucket" {
  project                     = var.project_id
  name                        = "amphi-static-content"
  location                    = "US"
  storage_class               = "STANDARD"
  uniform_bucket_level_access = true
}
/* [END] GCP storage bucket */


/* [START] GCP storage bucket IAM member */
resource "google_storage_bucket_iam_member" "amphi_static_content_bucket_professional_portfolio_access" {
  bucket = google_storage_bucket.amphi_static_content_bucket.name
  role   = "roles/storage.objectViewer"
  member = "serviceAccount:${var.professional_portfolio_service_account_email}"
}
/* [END] GCP storage bucket IAM member */


/* [START] GCP storage bucket IAM binding */
resource "google_storage_bucket_iam_binding" "professional_portfolio_service_account_access" {
  bucket  = google_storage_bucket.amphi_static_content_bucket.name
  role    = "roles/storage.objectViewer"
  #  members = [
  #    "serviceAccount:professional-portfolio-sa@${var.project_id}.iam.gserviceaccount.com",
  #  ]
  members = [
    "allUsers"
  ]
}
/* [END] GCP storage bucket IAM binding */


/* [START] Artifact Registry repositories */
resource "google_artifact_registry_repository" "react_labs_artifact_registry_repository" {
  provider = google-beta

  count = terraform.workspace == "delete-artifact-registry-repos" ? 0 : 1

  location      = var.region
  repository_id = "react-labs-test"
  description   = "Artifact Repository for testing React apps"
  format        = "DOCKER"

  labels = {
    environment = "sandbox"
  }
}

resource "google_artifact_registry_repository" "java17_spring_gradle_bigquery_reference_artifact_registry_repository" {
  provider = google-beta

  count = terraform.workspace == "delete-artifact-registry-repos" ? 0 : 1

  location      = var.region
  repository_id = "java17-spring-gradle-bigquery-reference-test"
  description   = "Artifact Repository for testing Spring Boot apps"
  format        = "DOCKER"

  labels = {
    environment = "sandbox"
  }
}

resource "google_artifact_registry_repository" "professional_portfolio_artifact_registry_repository" {
  provider = google-beta

  count = terraform.workspace == "delete-artifact-registry-repos" ? 0 : 1

  location      = var.region
  repository_id = "professional-portfolio"
  description   = "Artifact Repository for professional portfolio"
  format        = "DOCKER"

  labels = {
    environment = "sandbox"
  }
}

resource "google_artifact_registry_repository" "token_validator_service_artifact_registry_repository" {
  provider = google-beta

  count = terraform.workspace == "delete-artifact-registry-repos" ? 0 : 1

  location      = var.region
  repository_id = "token-validator-service"
  description   = "Artifact Repository for Token Validator service"
  format        = "DOCKER"

  labels = {
    environment = "sandbox"
  }
}

resource "google_artifact_registry_repository" "signed_url_generator_artifact_registry_repository" {
  provider = google-beta

  count = terraform.workspace == "delete-artifact-registry-repos" ? 0 : 1

  location      = var.region
  repository_id = "signed-url-generator"
  description   = "Artifact Repository for Signed URL Generator service"
  format        = "DOCKER"

  labels = {
    environment = "sandbox"
  }
}

resource "google_artifact_registry_repository" "itera_backend_artifact_registry_repository" {
  provider = google-beta

  count = terraform.workspace == "delete-artifact-registry-repos" ? 0 : 1

  location      = var.region
  repository_id = "itera-backend"
  description   = "Artifact Repository for Itera backend service"
  format        = "DOCKER"

  labels = {
    environment = "sandbox"
  }
}
/* [END] Artifact Registry repositories */


/* [START] GCP Cloud Run service IAM member */
resource "google_cloud_run_service_iam_member" "cloud_run_token_validator_invoker" {
  depends_on = [google_service_account.professional_portfolio_sa]

  location = var.region
  project  = var.project_id
  service  = "token-validator-service"
  role     = "roles/run.invoker"
  member   = "serviceAccount:${var.professional_portfolio_service_account_email}"
}

resource "google_cloud_run_service_iam_member" "cloud_run_token_validator_public_invoker" {
  location = var.region
  project  = var.project_id
  service  = "token-validator-service"
  role     = "roles/run.invoker"
  member   = "allUsers"
}

resource "google_cloud_run_service_iam_member" "cloud_run_signed_url_generator_public_invoker" {
  location = var.region
  project  = var.project_id
  service  = "signed-url-generator"
  role     = "roles/run.invoker"
  member   = "serviceAccount:${var.professional_portfolio_service_account_email}"
}

resource "google_cloud_run_service_iam_member" "cloud_run_signed_url_generator_invoker" {
  depends_on = [google_service_account.signed_url_generator_sa]

  location = var.region
  project  = var.project_id
  service  = "signed-url-generator"
  role     = "roles/run.invoker"
  member   = "serviceAccount:${var.professional_portfolio_service_account_email}"
}
/* [END] GCP Cloud Run service IAM member */


/* [START] Google project IAM binding */
resource "google_project_iam_binding" "gh_actions_pipeline_container_developer" {
  project = var.project_id
  role    = "roles/container.developer"

  members = [
    "serviceAccount:${var.gh_actions_pipeline_service_account_email}",
  ]
}

resource "google_project_iam_binding" "itera_backend_container_developer" {
  project = var.project_id
  role    = "roles/container.developer"

  members = [
    "serviceAccount:${var.itera_backend_service_account_email}",
  ]
}

resource "google_project_iam_binding" "gh_actions_pipeline_cluster_admin" {
  project = var.project_id
  role    = "roles/container.clusterAdmin"

  members = [
    "serviceAccount:${var.gh_actions_pipeline_service_account_email}",
  ]
}

resource "google_project_iam_binding" "itera_backend_cluster_admin" {
  project = var.project_id
  role    = "roles/container.clusterAdmin"

  members = [
    "serviceAccount:${var.itera_backend_service_account_email}",
  ]
}

resource "google_project_iam_binding" "gh_actions_pipeline_service_account_user" {
  project = var.project_id
  role    = "roles/iam.serviceAccountUser"

  members = [
    "serviceAccount:${var.gh_actions_pipeline_service_account_email}",
  ]
}
/* [END] Google project IAM binding */


/* [START] Google service account IAM member */
resource "google_service_account_iam_member" "itera_backend_workload_identity_user" {
  service_account_id = "projects/${var.project_id}/serviceAccounts/${var.itera_backend_service_account_email}"
  role               = "roles/iam.workloadIdentityUser"
  member             = "serviceAccount:${var.project_id}.svc.id.goog[default/itera-backend-k8s-service-account]"
}
/* [END] Google service account IAM member */
