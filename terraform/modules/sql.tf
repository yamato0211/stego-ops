resource "google_sql_database_instance" "stego" {
  name             = "${var.common.prefix}-stego-${var.common.environment}"
  region           = var.common.region
  database_version = "MYSQL_8_0"

  settings {
    tier              = "db-custom-2-7680"
    activation_policy = "ALWAYS"
    ip_configuration {
      ipv4_enabled = true
    }
    disk_type = "PD_SSD"
    disk_size = 10
  }
}

resource "google_sql_database" "stego" {
  name     = var.sql.database
  instance = google_sql_database_instance.stego.name
}

resource "google_sql_user" "stego" {
  name     = var.sql.user
  instance = google_sql_database_instance.stego.name
  password = var.sql.password
  host     = "%"
}