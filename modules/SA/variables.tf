variable "project_id" {
  description = "The ID of the GCP project."
  type        = string
}

variable "account_id" {
  description = "The account ID for the service account."
  type        = string
}

variable "display_name" {
  description = "The display name for the service account."
  type        = string
}

variable "bindings" {
  description = "A map of IAM roles and their respective members."
  type        = map(list(string))
}

variable "location" {
  description = "The location of the Artifact Registry repository."
  type        = string
}

variable "repository" {
  description = "The name of the Artifact Registry repository."
  type        = string
}