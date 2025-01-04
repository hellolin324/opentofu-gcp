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

output "pool_name" {
  description = "The name of the Workload Identity Pool"
  value       = module.github_oidc_robot_shop.pool_name
}

output "provider_name" {
  description = "The name of the Workload Identity Provider"
  value       = module.github_oidc_robot_shop.provider_name
}
