module "gke" {
  source           = "terraform-google-modules/kubernetes-engine/google"
  version          = "~> 25.0"
  region = var.region
  project_id       = var.project_id
  name             = var.cluster_name
  zones            = var.zones
  network          = var.network
  subnetwork       = var.subnetwork
  ip_range_pods    = var.ip_range_pods
  ip_range_services = var.ip_range_services
  node_pools       = var.node_pools
}


