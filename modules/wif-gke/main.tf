module "gke_cluster_workload_identity" {
  source              = "terraform-google-modules/kubernetes-engine/google//modules/workload-identity"
  name                = var.name
  namespace           = var.namespace
  project_id          = var.project_id
  roles               = var.roles
  automount_service_account_token = var.automount_service_account_token
}
