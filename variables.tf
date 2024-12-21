variable "project_id" {
  description = "GCP Project ID"
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
  }))
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