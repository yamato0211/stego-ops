output "command_to_connect_cluster" {
  value = "\n$ gcloud container clusters get-credentials ${var.common.prefix}-${var.gke.cluster}-${var.common.environment} --region ${var.common.region} --project ${var.common.project}\n"
}