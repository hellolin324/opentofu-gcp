module "github_oidc_robot_shop" {
  source      = "terraform-google-modules/github-actions-runners/google//modules/gh-oidc"
  version = "~> 4.0"
  project_id  = var.project_id
  pool_id     = var.pool_id
  provider_id = var.provider_id
  sa_mapping  = var.sa_mapping
  attribute_mapping = var.attribute_mapping
  attribute_condition = var.attribute_condition
}
