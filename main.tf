terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 6.11.0, < 7.0.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = ">= 6.11.0, < 7.0.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.10"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 2.1.0"
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
  secondary_ranges = var.secondary_ranges
}

module "gke" {
  source           = "./modules/gke"
  region           = var.region
  project_id       = var.project_id
  zones            = [var.zone]
  network          = module.vpc.network_name
  subnetwork       = values(module.vpc.subnets)[0].name //For now, only one subnet is in the input var, and it will only read the one and only subnet var as the subnet to deploy the gke cluster to
  cluster_name     = var.cluster_name
  ip_range_pods    = var.ip_range_pods
  ip_range_services = var.ip_range_services 
  node_pools       = var.node_pools
  remove_default_node_pool = var.remove_default_node_pool
  grant_registry_access = var.grant_registry_access
  
}

module "artifact_registry" {
  source  = "./modules/GCP-AR"
  project_id    = var.project_id
  location      = var.repo_location
}