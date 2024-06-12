# GKE Cluster module
module "gke" {
  source            = "terraform-google-modules/kubernetes-engine/google//modules/private-cluster"
  project_id        = var.common.project
  name              = "${var.common.prefix}-${var.gke.cluster}-${var.common.environment}"
  regional          = true
  region            = var.common.region
  network           = module.vpc.network_name
  subnetwork        = module.vpc.subnets_names[0]
  ip_range_pods     = local.ip_range_pods_name
  ip_range_services = local.ip_range_services_name
  node_pools = [
    {
      name               = "primary-node-pool"
      machine_type       = "n2-standard-2"
      node_locations     = var.common.zone
      min_count          = 1
      max_count          = 3
      disk_size_gb       = 50
      auto_repair        = true
      auto_upgrade       = true
      enable_autoscaling = true
      preemptible        = false
    },
  ]
}