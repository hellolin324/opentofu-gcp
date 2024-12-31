output "vpc_network_name" {
  description = "The name of the VPC network created"
  value       = module.vpc.network_name
}

output "gke_cluster_name" {
  description = "The name of the GKE cluster created"
  value       = module.gke.cluster_name
}

output "artifact_id" {
  description = "An identifier for the docker repo"
  value       = module.artifact_registry.artifact_id
}

output "github_actions_sa_email" {
  value = module.github_actions_service_account.email
}
