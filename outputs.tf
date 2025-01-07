output "vpc_network_name" {
  description = "The name of the VPC network created"
  value       = module.vpc.network_name
}

output "gke_cluster_name" {
  description = "The name of the GKE cluster created"
  value       = module.gke.cluster_name
}

output "location" {
  description = "Cluster location (region if regional cluster, zone if zonal cluster)"
  value       = module.gke.location
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

output "gcp_gke_service_account_email" {
  description = "Email address of GCP service account."
  value       = module.gke_cluster_workload_identity.gcp_service_account_email
}

output "k8s_service_account_name" {
  description = "Name of k8s service account."
  value       = module.gke_cluster_workload_identity.k8s_service_account_name
}