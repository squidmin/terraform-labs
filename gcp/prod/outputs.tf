output "project_id" {
  value = var.project_id
}

output "region" {
  value = var.region
}

output "project_admin_user_email" {
  value = var.project_admin_user_email
}

output "gh_actions_pipeline_service_account_email" {
  value = var.gh_actions_pipeline_service_account_email
}

output "discord_app_server_service_account_email" {
  value = google_service_account.discord_app_server_sa.email
}

output "github_actions_pipeline_credentials_path" {
  value = var.github_actions_pipeline_credentials_path
}

output "admin_credentials_path" {
  value = var.admin_credentials_path
}
