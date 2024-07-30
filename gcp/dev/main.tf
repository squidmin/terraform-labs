/* [START] GCP storage bucket */
resource "google_storage_bucket" "amphi_static_content_bucket" {
  project                     = var.project_id
  name                        = "amphi-static-content"
  location                    = "US"
  storage_class               = "STANDARD"
  uniform_bucket_level_access = true
}
/* [END] GCP storage bucket */


/* [START] Artifact Registry repositories */
#resource "google_artifact_registry_repository" "react_labs_artifact_registry_repository" {
#  provider = google-beta
#
#  count = terraform.workspace == "delete-artifact-registry-repos" ? 0 : 1
#
#  location      = var.region
#  repository_id = "react-labs-test"
#  description   = "Artifact Repository for testing React apps"
#  format        = "DOCKER"
#
#  labels = {
#    environment = "sandbox"
#  }
#}

#resource "google_artifact_registry_repository" "java17_spring_gradle_bigquery_reference_artifact_registry_repository" {
#  provider = google-beta
#
#  count = terraform.workspace == "delete-artifact-registry-repos" ? 0 : 1
#
#  location      = var.region
#  repository_id = "java17-spring-gradle-bigquery-reference-test"
#  description   = "Artifact Repository for testing Spring Boot apps"
#  format        = "DOCKER"
#
#  labels = {
#    environment = "sandbox"
#  }
#}

resource "google_artifact_registry_repository" "professional_portfolio_artifact_registry_repository" {
  provider = google-beta

  count = terraform.workspace == "delete-artifact-registry-repos" ? 0 : 1

  location      = var.region
  repository_id = "professional-portfolio"
  description   = "Artifact Repository for professional portfolio"
  format        = "DOCKER"

  labels = {
    environment = "sandbox"
  }
}

resource "google_artifact_registry_repository" "token_validator_service_artifact_registry_repository" {
  provider = google-beta

  count = terraform.workspace == "delete-artifact-registry-repos" ? 0 : 1

  location      = var.region
  repository_id = "token-validator-service"
  description   = "Artifact Repository for Token Validator service"
  format        = "DOCKER"

  labels = {
    environment = "sandbox"
  }
}

#resource "google_artifact_registry_repository" "signed_url_generator_artifact_registry_repository" {
#  provider = google-beta
#
#  count = terraform.workspace == "delete-artifact-registry-repos" ? 0 : 1
#
#  location      = var.region
#  repository_id = "signed-url-generator"
#  description   = "Artifact Repository for Signed URL Generator service"
#  format        = "DOCKER"
#
#  labels = {
#    environment = "sandbox"
#  }
#}

#resource "google_artifact_registry_repository" "itera_backend_artifact_registry_repository" {
#  provider = google-beta
#
#  count = terraform.workspace == "delete-artifact-registry-repos" ? 0 : 1
#
#  location      = var.region
#  repository_id = "itera-backend"
#  description   = "Artifact Repository for Itera backend service"
#  format        = "DOCKER"
#
#  labels = {
#    environment = "sandbox"
#  }
#}

resource "google_artifact_registry_repository" "discord_app_server_artifact_registry_repository" {
  provider = google-beta

  count = terraform.workspace == "delete-artifact-registry-repos" ? 0 : 1

  location = var.region
  repository_id = "discord-app-server"
  description = "Discord app server"
  format = "DOCKER"

  labels = {
    environment = "sandbox"
  }
}
/* [END] Artifact Registry repositories */
