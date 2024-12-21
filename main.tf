terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}

provider "google" {
  credentials = file("C:\\Users\\hello\\Documents\\repos\\opentofu-gcp\\opentofu-key.json")
  project     = var.project_id
  region      = var.region
}

provider "google-beta" {
  project = var.project_id
  region  = var.region
  credentials = file("C:\\Users\\hello\\Documents\\repos\\opentofu-gcp\\opentofu-key.json")
}

module "vpc" {
  source       = "./modules/vpc"
  project_id   = var.project_id
  network_name = var.network_name
  subnets      = var.subnets
}

module "gke" {
  source           = "./modules/gke"
  region           = var.region
  project_id       = var.project_id
  zones            = [var.zone]
  network          = module.vpc.network_name
  subnetwork       = module.vpc.subnets["${var.region}/node-pool-subnet"].name
  cluster_name     = var.cluster_name
  ip_range_pods    = var.ip_range_pods
  ip_range_services = var.ip_range_services 
  node_pools       = var.node_pools
}

