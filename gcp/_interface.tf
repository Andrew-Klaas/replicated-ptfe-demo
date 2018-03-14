
variable "environment_name" {
  type = "string"
}

variable "os" {
  type = "string"
}

variable "project" {
  type = "string"
}

variable "image" {
  type = "string"
}

variable "network" {
  type = "string"
}

variable "user" {
  type = "string"
}

variable "public_key" {
  type = "string"
}

variable "creds" {
 type = "string"
}

variable "region" {
  type = "string"
}

variable "zone" {
  type = "string"
}

variable "vpc_cidr" {
  default = "172.31.0.0/16"
}

#Outputs
output "ptfe_public_ips" {
  value = "${google_compute_instance.ptfe.*.network_interface.0.access_config.0.assigned_nat_ip}"
}

