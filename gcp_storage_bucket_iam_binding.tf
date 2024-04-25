/* [START] GCP storage bucket IAM binding */
resource "google_storage_bucket_iam_binding" "professional_portfolio_service_account_access" {
  bucket  = google_storage_bucket.amphi_static_content_bucket.name
  role    = "roles/storage.objectViewer"
  #  members = [
  #    "serviceAccount:professional-portfolio-sa@${var.project_id}.iam.gserviceaccount.com",
  #  ]
  members = [
    "allUsers"
  ]
}
/* [END] GCP storage bucket IAM binding */
