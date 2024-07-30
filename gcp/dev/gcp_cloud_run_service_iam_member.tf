/* [START] GCP Cloud Run service IAM member */
resource "google_cloud_run_service_iam_member" "cloud_run_portfolio_token_validator_invoker" {
  depends_on = [google_service_account.professional_portfolio_sa]

  location = var.region
  project  = var.project_id
  service  = "token-validator-service"
  role     = "roles/run.invoker"
  member   = "serviceAccount:${var.professional_portfolio_service_account_email}"
}

resource "google_cloud_run_service_iam_member" "cloud_run_portfolio_token_validator_public_invoker" {
  location = var.region
  project  = var.project_id
  service  = "token-validator-service"
  role     = "roles/run.invoker"
  member   = "allUsers"
}

#resource "google_cloud_run_service_iam_member" "cloud_run_signed_url_generator_invoker" {
#  depends_on = [google_service_account.signed_url_generator_sa]
#
#  location = var.region
#  project  = var.project_id
#  service  = "signed-url-generator"
#  role     = "roles/run.invoker"
#  member   = "serviceAccount:${var.professional_portfolio_service_account_email}"
#}

#resource "google_cloud_run_service_iam_member" "cloud_run_signed_url_generator_public_invoker" {
#  location = var.region
#  project  = var.project_id
#  service  = "signed-url-generator"
#  role     = "roles/run.invoker"
#  member   = "serviceAccount:${var.professional_portfolio_service_account_email}"
#}

resource "google_cloud_run_service_iam_member" "cloud_run_discord_app_server_invoker" {
  location = var.region
  project  = var.project_id
  service  = "discord-app-server"
  role     = "roles/run.invoker"
  member   = "serviceAccount:${var.discord_app_server_service_account_email}"
}

resource "google_cloud_run_service_iam_member" "cloud_run_discord_app_server_public_invoker" {
  location = var.region
  project  = var.project_id
  service  = "discord-app-server"
  role     = "roles/run.invoker"
  member   = "allUsers"
}
/* [END] GCP Cloud Run service IAM member */
