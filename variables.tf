variable "project_id" {
  type    = string
  default = "lofty-root-378503"
}

variable "region" {
  type    = string
  default = "us-central1"
}

variable "gh_actions_pipeline_service_account_email" {
  type    = string
  default = "gh-actions-pipeline@lofty-root-378503.iam.gserviceaccount.com"
}

variable "itera_backend_service_account_email" {
  type        = string
  description = "The service account email"
  default     = "itera-backend-sa@lofty-root-378503.iam.gserviceaccount.com"
}

variable "github_actions_pipeline_credentials_path" {
  type    = string
  default = "~/.config/gcloud/gh-actions-pipeline-key.json"
}

variable "admin_credentials_path" {
  type = string
  default = "~/.config/gcloud/sa-private-key.json"
}

variable "gke_cluster_name" {
  description = "The name of the GKE cluster"
  default     = "autopilot-cluster-1"
}
