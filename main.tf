terraform {
  required_version = ">= 0.13"

  required_providers {
    google-beta = {
      source  = "hashicorp/google-beta"
      version = ">= 3.53.0"
    }
  }
}

provider "google-beta" {
  credentials = file(var.admin_credentials_path)
  project     = var.project_id
  region      = var.region
}

terraform {
  backend "gcs" {
    bucket = "lofty-root-tf-state"
    prefix = "terraform/state"
  }
}


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
  member = "serviceAccount:professional-portfolio-sa@${var.project_id}.iam.gserviceaccount.com"
}
/* [END] GCP storage bucket IAM member */


/* [START] GCP Compute backend bucket for Cloud CDN */
resource "google_compute_backend_bucket" "cdn_backend" {
  project     = var.project_id
  name        = "cdn-backend-bucket"
  bucket_name = google_storage_bucket.amphi_static_content_bucket.name

  cdn_policy {
    cache_mode                   = "CACHE_ALL_STATIC"
    client_ttl                   = 3600
    default_ttl                  = 3600
    max_ttl                      = 86400
    signed_url_cache_max_age_sec = 0
    negative_caching             = true
    request_coalescing           = true
  }
}
/* [END] GCP Compute backend bucket for Cloud CDN */


/* [START] Provision an External HTTPS Load Balancer */
resource "google_compute_url_map" "default" {
  project         = var.project_id
  name            = "url-map"
  default_service = google_compute_backend_bucket.cdn_backend.self_link
}

resource "google_compute_target_http_proxy" "default" {
  project = var.project_id
  name    = "http-proxy"
  url_map = google_compute_url_map.default.self_link
}

resource "google_compute_global_forwarding_rule" "default" {
  project    = var.project_id
  name       = "http-content-rule"
  target     = google_compute_target_http_proxy.default.self_link
  port_range = "80"
}
/* [END] Provision an External HTTPS Load Balancer */


/* [START] GCP storage bucket IAM binding */
resource "google_storage_bucket_iam_binding" "professional_portfolio_service_account_access" {
  bucket  = google_storage_bucket.amphi_static_content_bucket.name
  role    = "roles/storage.objectViewer"
  members = [
    "serviceAccount:professional-portfolio-sa@${var.project_id}.iam.gserviceaccount.com",
  ]
}
/* [END] GCP storage bucket IAM binding */


/* [START] GCP project IAM member */
resource "google_project_iam_member" "run_admin" {
  project = var.project_id
  role    = "roles/run.admin"
  member  = "serviceAccount:gh-actions-pipeline@${var.project_id}.iam.gserviceaccount.com"
}

resource "google_project_iam_member" "artifact_registry_admin" {
  project = var.project_id
  role    = "roles/artifactregistry.admin"
  member  = "serviceAccount:gh-actions-pipeline@${var.project_id}.iam.gserviceaccount.com"
}

resource "google_project_iam_member" "artifact_registry_user" {
  project = var.project_id
  role    = "roles/artifactregistry.admin"
  member  = "user:morse.james.r@gmail.com"
}

resource "google_project_iam_member" "gh_actions_pipeline_service_account_user" {
  project = var.project_id
  role    = "roles/iam.serviceAccountUser"
  member  = "serviceAccount:gh-actions-pipeline@${var.project_id}.iam.gserviceaccount.com"
}

resource "google_project_iam_member" "gh_actions_pipeline_push_to_artifact_registry" {
  project = var.project_id
  role    = "roles/artifactregistry.writer"
  member  = "serviceAccount:gh-actions-pipeline@${var.project_id}.iam.gserviceaccount.com"
}
/* [END] GCP project IAM member */


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
/* [END] Artifact Registry repositories */


/* [START] GCP service account */
resource "google_service_account" "gh_actions_pipeline" {
  account_id   = "gh-actions-pipeline"
  display_name = "GitHub Actions Pipeline"
  project      = var.project_id
}

resource "google_service_account" "react_labs_sa" {
  account_id   = "react-labs-sa"
  display_name = "React Labs service account"
  project      = var.project_id
}

resource "google_service_account" "professional_portfolio_sa" {
  account_id   = "professional-portfolio-sa"
  display_name = "Professional portfolio service account"
  project      = var.project_id
}

resource "google_service_account" "token_validator_service_sa" {
  account_id   = "token-validator-service-sa"
  display_name = "Token validator backend application service account"
  project      = var.project_id
}
/* [END] GCP service account */


/* [START] GCP Cloud Run service IAM member */
#resource "google_cloud_run_service_iam_member" "invoker" {
#  location = var.region
#  project  = var.project_id
#  service  = "java17-spring-gradle-bigquery-reference"
#  role     = "roles/run.invoker"
#  member   = "serviceAccount:${var.service_account_email}"
#}

resource "google_cloud_run_service_iam_member" "cloud_run_token_validator_invoker" {
  depends_on = [google_service_account.professional_portfolio_sa]

  location = var.region
  project  = var.project_id
  service  = "token-validator-service"
  role     = "roles/run.invoker"
  member   = "serviceAccount:professional-portfolio-sa@${var.project_id}.iam.gserviceaccount.com"
}

resource "google_cloud_run_service_iam_member" "cloud_run_token_validator_public_invoker" {
  location = var.region
  project  = var.project_id
  service  = "token-validator-service"
  role     = "roles/run.invoker"
  member   = "allUsers"
}
/* [END] GCP Cloud Run service IAM member */
