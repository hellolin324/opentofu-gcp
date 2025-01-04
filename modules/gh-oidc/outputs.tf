output "pool_name" {
  description = "The name of the Workload Identity Pool"
  value       = module.github_oidc_robot_shop.pool_name
}

output "provider_name" {
  description = "The name of the Workload Identity Provider"
  value       = module.github_oidc_robot_shop.provider_name
}
