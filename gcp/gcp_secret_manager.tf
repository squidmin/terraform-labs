/* [START] GCP secret manager */
// Define a new secret with automatic replication.
#resource "google_secret_manager_secret" "my_secret" {
#  secret_id = "my-secret"
#
#  replication {
#    automatic = true
#  }
#}

// Add a secret version.
#resource "google_secret_manager_secret_version" "my_secret_version" {
#  secret      = google_secret_manager_secret.my_secret.id
#  secret_data = "my super secret data"
#}
/* [END GCP secret manager] */
