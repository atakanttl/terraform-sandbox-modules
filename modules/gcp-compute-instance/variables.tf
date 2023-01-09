variable "project" {
  type = string
}

variable "region" {
  type = string
}

variable "zone" {
  type    = string
  default = null
}

variable "prefix" {
  type = string
}

variable "machine_type" {
  type    = string
  default = "e2-medium"
}

variable "disk_size_gb" {
  type    = number
  default = 20
}

variable "vpc_name" {
  type = string
}

variable "subnet_name" {
  type = string
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
