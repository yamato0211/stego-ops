resource "google_dns_managed_zone" "zone" {
  name     = "${var.common.prefix}-zone-${var.common.environment}"
  dns_name = "${var.dns.domain}."
}

resource "google_dns_record_set" "plesio" {
  name         = "gateway.${var.dns.domain}."
  type         = "A"
  ttl          = 300
  managed_zone = google_dns_managed_zone.zone.name
  rrdatas      = [google_compute_global_address.gateway_static_ip.address]
}

resource "google_dns_record_set" "pipecd" {
  name         = "pipecd.${var.dns.domain}."
  type         = "A"
  ttl          = 300
  managed_zone = google_dns_managed_zone.zone.name
  rrdatas      = [google_compute_global_address.pipecd_static_ip.address]
}