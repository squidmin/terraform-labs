variable "project_id" {
  type    = string
  default = "lofty-root-prod"
}

variable "region" {
  type    = string
  default = "us-central1"
}

variable "project_admin_user_email" {
  type    = string
  default = "morse.james.r@gmail.com"
}

variable "gh_actions_pipeline_service_account_email" {
  type    = string
  default = "gh-actions-pipeline@lofty-root-prod.iam.gserviceaccount.com"
}

variable "discord_app_server_service_account_email" {
  type        = string
  description = "Service account email for Discord app server"
  default     = "discord-app-server-sa@lofty-root-prod.iam.gserviceaccount.com"
}

variable "github_actions_pipeline_credentials_path" {
  type    = string
  default = "~/.config/gcloud/gh-actions-pipeline-key_PROD.json"
}

variable "admin_credentials_path" {
  type    = string
  default = "~/.config/gcloud/sa-private-key_PROD.json"
}
