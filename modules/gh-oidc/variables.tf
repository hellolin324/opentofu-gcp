variable "pool_id" {
  description = "Workload Identity Federation Pool ID"
  type        = string
}

variable "provider_id" {
  description = "Workload Identity Federation Provider ID"
  type        = string
}

variable "sa_mapping" {
  description = "Service account mappings for Workload Identity Federation"
  type = map(object({
    sa_name   = string
    attribute = string
  }))
}

variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "attribute_mapping" {
  type        = map(any)
  description = "Workload Identity Pool Provider attribute mapping. [More info](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_workload_identity_pool_provider#attribute_mapping)"
  default = {
    "google.subject"       = "assertion.sub"
    "attribute.actor"      = "assertion.actor"
    "attribute.aud"        = "assertion.aud"
    "attribute.repository" = "assertion.repository"
  }
}

variable "attribute_condition" {
  type        = string
  description = "Workload Identity Pool Provider attribute condition expression. [More info](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_workload_identity_pool_provider#attribute_condition)"
  default     = null
}