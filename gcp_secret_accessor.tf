/* [START] GCP secret accessor */
resource "google_project_iam_member" "project_admin_secret_accessor" {
  project = var.project_id
  role    = "roles/secretmanager.secretAccessor"
  member  = "user:${var.project_admin_user_email}"
}

resource "google_project_iam_member" "signed_url_generator_secret_accessor" {
  project = var.project_id
  role    = "roles/secretmanager.secretAccessor"
  member  = "serviceAccount:${var.signed_url_generator_service_account_email}"
}

resource "google_secret_manager_secret_iam_member" "signed_url_generator_secret_accessor" {
  project   = var.project_id
  secret_id = "professional-portfolio-sa-key"
  role      = "roles/secretmanager.secretAccessor"
  member    = "serviceAccount:${var.signed_url_generator_service_account_email}"
}

resource "google_secret_manager_secret_iam_member" "itera_backend_secret_accessor" {
  project   = var.project_id
  secret_id = var.openai_api_key_secret_name
  role      = "roles/secretmanager.secretAccessor"
  member    = "serviceAccount:${var.itera_backend_service_account_email}"
}

resource "google_secret_manager_secret_iam_member" "gemini_api_backend_secret_accessor_1" {
  project   = var.project_id
  secret_id = var.gemini_api_key_secret_name
  role      = "roles/secretmanager.secretAccessor"
  member    = "serviceAccount:${var.gemini_api_backend_service_account_email}"
}

resource "google_secret_manager_secret_iam_member" "gemini_api_backend_secret_accessor_2" {
  project   = var.project_id
  secret_id = var.gemini_api_key_secret_name
  role      = "roles/secretmanager.secretAccessor"
  member    = "user:${var.project_admin_user_email}"
}

# Assuming the secret already exists, we use a data source to reference it.
data "google_secret_manager_secret" "openai_api_key" {
  secret_id = var.openai_api_key_secret_name
  project   = var.project_id
}

resource "google_secret_manager_secret_iam_policy" "openai_api_key_policy" {
  project   = var.project_id
  secret_id = data.google_secret_manager_secret.openai_api_key.secret_id

  policy_data = jsonencode({
    bindings = [
      {
        role    = "roles/secretmanager.secretAccessor"
        members = [
          "serviceAccount:${var.itera_backend_service_account_email}",
        ]
      }
    ]
  })
}

data "google_secret_manager_secret" "gemini_api_key" {
  secret_id = var.gemini_api_key_secret_name
  project   = var.project_id
}

resource "google_secret_manager_secret_iam_policy" "gemini_api_key_policy" {
  project   = var.project_id
  secret_id = data.google_secret_manager_secret.gemini_api_key.secret_id

  policy_data = jsonencode({
    bindings = [
      {
        role    = "roles/secretmanager.secretAccessor"
        members = [
          "user:${var.project_admin_user_email}",
          "serviceAccount:${var.default_compute_engine_service_account}",
          "serviceAccount:${var.gemini_api_backend_service_account_email}"
        ]
      }
    ]
  })
}

resource "google_secret_manager_secret_iam_binding" "secret_accessor" {
  project   = var.project_id
  secret_id = "gemini-api-key"

  role = "roles/secretmanager.secretAccessor"

  members = [
    "user:${var.project_admin_user_email}",
    "serviceAccount:${var.default_compute_engine_service_account}",
    "serviceAccount:${var.gemini_api_backend_service_account_email}"
  ]
}
/* [END] GCP secret accessor */
