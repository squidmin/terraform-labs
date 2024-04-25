variable "project_id" {
  type    = string
  default = "lofty-root-378503"
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
  default = "gh-actions-pipeline@lofty-root-378503.iam.gserviceaccount.com"
}

variable "professional_portfolio_service_account_email" {
  type    = string
  default = "professional-portfolio-sa@lofty-root-378503.iam.gserviceaccount.com"
}

variable "itera_backend_service_account_email" {
  type        = string
  description = "The service account email"
  default     = "itera-backend-sa@lofty-root-378503.iam.gserviceaccount.com"
}

variable "gemini_api_backend_service_account_email" {
  type        = string
  description = "The service account email"
  default     = "gemini-api-backend-sa@lofty-root-378503.iam.gserviceaccount.com"
}

variable "signed_url_generator_service_account_email" {
  type        = string
  description = "The service account email for the signed url generator"
  default     = "signed-url-generator-sa@lofty-root-378503.iam.gserviceaccount.com"
}

variable "github_actions_pipeline_credentials_path" {
  type    = string
  default = "~/.config/gcloud/gh-actions-pipeline-key.json"
}

variable "admin_credentials_path" {
  type    = string
  default = "~/.config/gcloud/sa-private-key.json"
}

variable "gke_cluster_name" {
  description = "The name of the GKE cluster"
  default     = "autopilot-cluster-1"
}

variable "openai_api_key_secret_name" {
    description = "The name of the secret that stores the OpenAI API key"
    default     = "openai-api-key"
}

variable "gemini_api_key_secret_name" {
  description = "The name of the secret that stores the Gemini API key"
  default     = "gemini-api-key"
}
