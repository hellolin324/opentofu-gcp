output "gcp_service_account_email" {
  description = "Email address of GCP service account."
  value       = module.gke_cluster_workload_identity.gcp_service_account_email
}

output "k8s_service_account_name" {
  description = "Name of k8s service account."
  value       = module.gke_cluster_workload_identity.k8s_service_account_name
}