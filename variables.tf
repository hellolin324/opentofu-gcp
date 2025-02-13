variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "repo_location" {
  description = "The location of this Artifact Registry Repo"
  type        = string
}

variable "region" {
  description = "GCP Region"
  type        = string
}

variable "zone" {
  description = "GCP Zone"
  type        = string
}

variable "network_name" {
  description = "VPC Network Name"
  type        = string
}

variable "subnets" {
  description = "List of subnets to create"
  type = list(object({
    subnet_name   = string
    subnet_region = string
    subnet_ip     = string
    subnet_private_access = optional(string, "false")
  }))
}

variable "secondary_ranges" {
  type        = map(list(object({ range_name = string, ip_cidr_range = string })))
  description = "Secondary ranges that will be used in some of the subnets"
  default     = {}
}


variable "cluster_name" {
  description = "GKE Cluster Name"
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

variable "ip_range_pods" {
  description = "IP range for Kubernetes Pods"
  type        = string
}

variable "ip_range_services" {
  description = "IP range for Kubernetes Services"
  type        = string
}

variable "remove_default_node_pool" {
  description = "Whether to remove the default node pool created by GKE"
  type        = bool
  default     = true
}

variable "grant_registry_access" {
  type        = bool
  description = "Grants created cluster-specific service account storage.objectViewer and artifactregistry.reader roles."
  default     = false
}

variable "k8s_service_account_name" {
  description = "Name for both service accounts. The GCP SA will be truncated to the first 30 chars if necessary."
  type        = string
}

variable "k8s_namespace" {
  description = "Namespace for the Kubernetes service account"
  type        = string
  default     = "default"
}

variable "k8s_roles" {
  description = "A list of roles to be added to the created gcp service account"
  type        = list(string)
  default     = []
}

variable "automount_service_account_token" {
  description = "Enable automatic mounting of the service account token"
  type        = bool
  default     = false
}