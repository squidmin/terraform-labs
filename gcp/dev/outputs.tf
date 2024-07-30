output "project_id" {
  value = var.project_id
}

output "region" {
  value = var.region
}

output "project_admin_user_email" {
  value = var.project_admin_user_email
}

output "default_compute_engine_service_account_email" {
  value = var.default_compute_engine_service_account_email
}

output "gh_actions_pipeline_service_account_email" {
  value = var.gh_actions_pipeline_service_account_email
}

output "professional_portfolio_service_account_email" {
  value = var.professional_portfolio_service_account_email
}

#output "itera_backend_service_account_email" {
#  value = var.itera_backend_service_account_email
#}

#output "gemini_api_backend_service_account_email" {
#  value = var.gemini_api_backend_service_account_email
#}

output "signed_url_generator_service_account_email" {
  value = var.signed_url_generator_service_account_email
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

#output "gke_cluster_name" {
#  value = var.gke_cluster_name
#}

#output "openai_api_key_secret_name" {
#  value = var.openai_api_key_secret_name
#}

#output "gemini_api_key_secret_name" {
#  value = var.gemini_api_key_secret_name
#}
