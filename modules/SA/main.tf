//Service account for github actions
resource "google_service_account" "this" {
  account_id   = var.account_id
  display_name = var.display_name
  project      = var.project_id
}

resource "google_service_account_key" "this" {
  service_account_id = google_service_account.this.name
  public_key_type    = "TYPE_X509_PEM_FILE"
  private_key_type   = "TYPE_GOOGLE_CREDENTIALS_FILE"
}

module "service_account_iam_bindings" {
  source   = "terraform-google-modules/iam/google//modules/service_accounts_iam"
  version  = "~> 8.0"

  service_accounts = [google_service_account.this.email]
  project          = var.project_id
  mode             = "additive"
  
  bindings = var.bindings
}

resource "google_project_iam_member" "artifact_registry_admin" {
  project = var.project_id
  role    = "roles/artifactregistry.admin"
  member  = "serviceAccount:opentofu-sa@graceful-byway-445402-q0.iam.gserviceaccount.com"
}

resource "google_artifact_registry_repository_iam_member" "artifact_registry_writer" {
  project    = var.project_id
  location   = var.location
  repository = var.repository
  role       = "roles/artifactregistry.writer"
  member     = "serviceAccount:${google_service_account.this.email}"

  depends_on = [google_project_iam_member.artifact_registry_admin]
}

