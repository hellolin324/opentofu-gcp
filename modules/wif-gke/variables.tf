variable "name" {
  description = "Name for both service accounts. The GCP SA will be truncated to the first 30 chars if necessary."
  type        = string
}

variable "namespace" {
  description = "Namespace for the Kubernetes service account"
  type        = string
  default     = "default"
}

variable "roles" {
  description = "A list of roles to be added to the created gcp service account"
  type        = list(string)
  default     = []
}

variable "automount_service_account_token" {
  description = "Enable automatic mounting of the service account token"
  type        = bool
  default     = false
}

variable "project_id" {
  description = "GCP project ID"
  type        = string
}