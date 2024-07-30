/* [START] GCP storage bucket */

/* [END] GCP storage bucket */


/* [START] Artifact Registry repositories */
resource "google_artifact_registry_repository" "discord_app_server_artifact_registry_repository" {
  provider = google-beta

  count = terraform.workspace == "delete-artifact-registry-repos" ? 0 : 1

  location      = var.region
  repository_id = "discord-app-server"
  description   = "Artifact registry for discord app server"
  format        = "DOCKER"

  labels = {
    environment = "prod"
  }
}
/* [END] Artifact Registry repositories */
