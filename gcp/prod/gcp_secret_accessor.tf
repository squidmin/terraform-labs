/* [START] GCP secret accessor */
resource "google_project_iam_member" "project_admin_secret_accessor" {
  project = var.project_id
  role    = "roles/secretmanager.secretAccessor"
  member  = "user:${var.project_admin_user_email}"
}
/* [END] GCP secret accessor */
