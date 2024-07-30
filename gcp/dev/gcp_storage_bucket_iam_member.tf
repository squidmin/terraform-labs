/* [START] GCP storage bucket IAM member */
resource "google_storage_bucket_iam_member" "amphi_static_content_bucket_professional_portfolio_access" {
  bucket = google_storage_bucket.amphi_static_content_bucket.name
  role   = "roles/storage.objectViewer"
  member = "serviceAccount:${var.professional_portfolio_service_account_email}"
}
/* [END] GCP storage bucket IAM member */
