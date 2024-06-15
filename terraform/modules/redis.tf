resource "google_redis_instance" "redis" {
  name              = "${var.common.prefix}-redis-${var.common.environment}"
  tier              = "BASIC"
  memory_size_gb    = 8
  region            = var.common.region
  redis_version     = "REDIS_7_0"
  authorized_network = module.vpc.network_id
}
