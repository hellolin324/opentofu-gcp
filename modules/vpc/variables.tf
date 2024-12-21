variable "project_id" {
  description = "GCP Project ID"
  type        = string
  default = "graceful-byway-445402-q0"
}

variable "network_name" {
  description = "VPC Network Name"
  type        = string
  default = "gke"
}

variable "subnets" {
  description = "List of subnets to create"
  type = list(object({
    subnet_name   = string
    subnet_region = string
    subnet_ip     = string
  }))
}