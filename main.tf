terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "~> 3.5"
    }
  }
}

provider "google" {
  credentials = file(var.google_application_credentials_path)
  project = var.project_id
  region = var.region
}

terraform {
  backend "gcs" {
    bucket = "lofty-root-tf-state"
    prefix = "terraform/state"
  }
}

resource "google_cloud_run_service_iam_member" "invoker" {
  location = var.region
  project  = var.project_id
  service  = var.cloud_run_service_name
  role     = "roles/run.invoker"
  member   = "serviceAccount:${var.service_account_email}"
}
