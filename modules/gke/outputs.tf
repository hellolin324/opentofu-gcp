output "cluster_name" {
  description = "The name of the GKE cluster created"
  value       = module.gke.name
}
