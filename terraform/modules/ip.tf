resource "google_compute_global_address" "gateway_static_ip" {
  name    = "${var.common.prefix}-gateway-static-ip-${var.common.environment}"
  project = var.common.project
}

resource "google_compute_global_address" "pipecd_static_ip" {
  name    = "${var.common.prefix}-pipecd-static-ip-${var.common.environment}"
  project = var.common.project
}