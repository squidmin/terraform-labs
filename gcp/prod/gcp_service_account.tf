/* [START] GCP service account */
resource "google_service_account" "gh_actions_pipeline" {
  account_id   = "gh-actions-pipeline"
  display_name = "GitHub Actions Pipeline production service account"
  project      = var.project_id
}

resource "google_service_account" "discord_app_server_sa" {
  account_id   = "discord-app-server-sa"
  display_name = "Discord App Server production service account"
  project      = var.project_id
}

resource "google_service_account" "terraform_prod_sa" {
  account_id   = "terraform-sa"
  display_name = "Terraform production service account"
  project      = var.project_id
}
/* [END] GCP service account */
