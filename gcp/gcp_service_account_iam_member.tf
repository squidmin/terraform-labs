/* [START] Google service account IAM member */
resource "google_service_account_iam_member" "itera_backend_workload_identity_user" {
  service_account_id = "projects/${var.project_id}/serviceAccounts/${var.itera_backend_service_account_email}"
  role               = "roles/iam.workloadIdentityUser"
  member             = "serviceAccount:${var.project_id}.svc.id.goog[default/itera-backend-k8s-service-account]"
}
/* [END] Google service account IAM member */
