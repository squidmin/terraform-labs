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

resource "google_service_account" "signed_url_generator_sa" {
  account_id   = "signed-url-generator-sa"
  display_name = "GCS signed URL generator backend application service account"
  project      = var.project_id
}

resource "google_service_account" "itera_backend_sa" {
  depends_on   = [google_secret_manager_secret_iam_member.itera_backend_secret_accessor]
  account_id   = "itera-backend-sa"
  display_name = "Itera backend application service account"
  project      = var.project_id
}

resource "google_service_account" "gemini_api_backend_sa" {
  account_id   = "gemini-api-backend-sa"
  display_name = "Gemini API backend application service account"
  project      = var.project_id
}
/* [END] GCP service account */
