locals {
  ip_range_pods_name     = "${var.common.prefix}-pods-${var.common.environment}"
  ip_range_services_name = "${var.common.prefix}-services-${var.common.environment}"
}