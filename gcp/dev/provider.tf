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
