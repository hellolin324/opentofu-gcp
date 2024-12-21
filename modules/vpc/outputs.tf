output "network_name" {
  description = "The name of the VPC network created"
  value       = module.vpc.network_name
}

output "subnets" {
  description = "Subnets created in the VPC"
  value       = module.vpc.subnets
}
