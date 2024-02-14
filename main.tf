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

resource "google_project_iam_member" "artifact_registry_admin" {
  project = var.project_id
  role    = "roles/artifactregistry.admin"
  member  = "serviceAccount:gh-actions-pipeline@${var.project_id}.iam.gserviceaccount.com"
}

resource "google_project_iam_member" "gh-actions-pipeline-push-to-artifact-registry" {
  project = var.project_id
  role    = "roles/artifactregistry.writer"
  member  = "serviceAccount:gh-actions-pipeline@${var.project_id}.iam.gserviceaccount.com"
}

resource "google_project_iam_member" "artifact_registry_user" {
  project = var.project_id
  role    = "roles/artifactregistry.admin"
  member  = "user:morse.james.r@gmail.com"
}

resource "google_artifact_registry_repository" "react-labs-artifact-registry-repository" {
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

resource "google_artifact_registry_repository" "java17-spring-gradle-bigquery-reference-artifact-registry-repository" {
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

resource "google_service_account" "gh_actions_pipeline" {
  account_id   = "gh-actions-pipeline"
  display_name = "GitHub Actions Pipeline"
  project      = var.project_id
}

resource "google_project_iam_member" "gh_actions_pipeline_service_account_user" {
  project = var.project_id
  role    = "roles/iam.serviceAccountUser"
  member  = "serviceAccount:gh-actions-pipeline@${var.project_id}.iam.gserviceaccount.com"
}

resource "google_project_iam_member" "run_admin" {
  project = var.project_id
  role    = "roles/run.admin"
  member  = "serviceAccount:gh-actions-pipeline@${var.project_id}.iam.gserviceaccount.com"
}

resource "google_service_account" "react-labs-sa" {
  account_id   = "react-labs-sa"
  display_name = "React Labs service account"
  project      = var.project_id
}

#resource "google_cloud_run_service_iam_member" "invoker" {
#  location = var.region
#  project  = var.project_id
#  service  = "java17-spring-gradle-bigquery-reference"
#  role     = "roles/run.invoker"
#  member   = "serviceAccount:${var.service_account_email}"
#}
