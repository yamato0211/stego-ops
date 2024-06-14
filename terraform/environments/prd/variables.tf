variable "common" {
  type = object({
    project     = string
    region      = string
    prefix      = string
    zone        = string
    environment = string
  })
  description = "Common variables for all environments"
}

variable "vpc" {
  type = object({
    subnet_cidr = string
    pod_cidr    = string
    svc_cidr    = string
  })
}

variable "gke" {
  type = object({
    cluster = string
  })
}

variable "dns" {
  type = object({
    domain = string
  })
}

variable "sql" {
  type = object({
    database = string
    password = string
    user     = string
  })
}