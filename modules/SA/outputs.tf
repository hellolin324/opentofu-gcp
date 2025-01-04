output "email" {
  value = google_service_account.this.email
}

output "name" {
  description = "The fully-qualified resource name of the service account"
  value       = google_service_account.this.name
}

output "member" {
  description = "The Identity of the service account"
  value       = google_service_account.this.member
}