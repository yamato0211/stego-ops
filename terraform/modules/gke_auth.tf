# gke auth
module "gke_auth" {
  source       = "terraform-google-modules/kubernetes-engine/google//modules/auth"
  depends_on   = [module.gke]
  project_id   = var.common.project
  location     = module.gke.location
  cluster_name = module.gke.name
}

# kubeconfig
resource "local_file" "kubeconfig" {
  content  = module.gke_auth.kubeconfig_raw
  filename = "${var.common.prefix}-kubeconfig-${var.common.environment}"
}