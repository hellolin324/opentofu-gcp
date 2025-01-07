output "cluster_name" {
  description = "The name of the GKE cluster created"
  value       = module.gke.name
}

output "location" {
  description = "Cluster location (region if regional cluster, zone if zonal cluster)"
  value       = module.gke.location
}
