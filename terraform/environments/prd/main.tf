module "main" {
  source = "../../modules"
  common = var.common
  vpc    = var.vpc
  gke    = var.gke
  dns    = var.dns
  sql    = var.sql
}