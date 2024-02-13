variable "project_id" {
  type    = string
  default = "lofty-root-378503"
}

variable "region" {
  type    = string
  default = "us-central1"
}

variable "service_account_email" {
  type    = string
  default = "tekton-pipeline@lofty-root-378503.iam.gserviceaccount.com"
}

variable "github_actions_pipeline_credentials_path" {
  type    = string
  default = "~/.config/gcloud/gh-actions-pipeline-key.json"
}

variable "cloud_run_service_name" {
  type    = string
  default = "java17-spring-gradle-bigquery-reference"
}
