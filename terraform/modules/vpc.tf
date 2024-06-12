# VPC module
module "vpc" {
  source       = "terraform-google-modules/network/google"
  version      = "8.1.0"
  project_id   = var.common.project
  network_name = "${var.common.prefix}-vpc-${var.common.environment}"
  subnets = [
    {
      subnet_name   = "${var.common.prefix}-subnet-${var.common.environment}"
      subnet_ip     = var.vpc.subnet_cidr
      subnet_region = var.common.region
    },
  ]
  secondary_ranges = {
    "${var.common.prefix}-subnet-${var.common.environment}" = [
      {
        range_name    = local.ip_range_pods_name
        ip_cidr_range = var.vpc.pod_cidr
      },
      {
        range_name    = local.ip_range_services_name
        ip_cidr_range = var.vpc.svc_cidr
      },
    ]
  }
}