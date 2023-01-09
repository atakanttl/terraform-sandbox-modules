variable "project" {
  type = string
}

variable "region" {
  type = string
}

variable "prefix" {
  type = string
}

variable "subnet_range" {
  type    = string
  default = "10.0.0.0/24"
}

variable "machine_type" {
  type    = string
  default = "e2-medium"
}

variable "disk_size_gb" {
  type    = number
  default = 20
}

variable "image_name" {
  type    = string
  default = "ubuntu-os-cloud/ubuntu-2204-lts"
}

variable "enable_public_ip" {
  type    = bool
  default = false
}

variable "enable_spot" {
  type    = bool
  default = false
}

