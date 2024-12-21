output "vpc_network_name" {
  description = "The name of the VPC network created"
  value       = module.vpc.network_name
}

output "gke_cluster_name" {
  description = "The name of the GKE cluster created"
  value       = module.gke.cluster_name
}
