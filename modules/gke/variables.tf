variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP Region"
  type        = string
}

variable "network" {
  description = "VPC Network Name"
  type        = string
}

variable "subnetwork" {
  description = "Subnetwork name for GKE cluster"
  type        = string
}


variable "cluster_name" {
  description = "GKE Cluster Name"
  type        = string
}

variable "zones" {
  description = "List of GCP zones for the GKE cluster"
  type        = list(string)
}

variable "ip_range_pods" {
  description = "IP range for Kubernetes Pods"
  type        = string
}

variable "ip_range_services" {
  description = "IP range for Kubernetes Services"
  type        = string
}

variable "node_pools" {
  description = "Node pool configuration"
  type = list(object({
    name          = string
    machine_type  = string
    min_count     = number
    max_count     = number
    disk_size_gb  = number
    auto_repair   = bool
    auto_upgrade  = bool
    cpu_cfs_quota = bool
  }))
}

variable "remove_default_node_pool" {
  description = "Whether to remove the default node pool created by GKE"
  type        = bool
  default     = false
}

variable "grant_registry_access" {
  type        = bool
  description = "Grants created cluster-specific service account storage.objectViewer and artifactregistry.reader roles."
  default     = false
}