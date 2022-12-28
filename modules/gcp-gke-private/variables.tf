variable "project" {
  type = string
}

variable "region" {
  type = string
}

variable "zone_count" {
  type    = number
  default = 1

  validation {
    condition     = var.zone_count > 0
    error_message = "zone_count must be greater than 0."
  }
}

variable "prefix" {
  type = string
}

variable "vpc_name" {
  type = string
}

variable "subnet_name" {
  type = string
}

variable "secondary_range_pods_name" {
  type = string
}

variable "secondary_range_services_name" {
  type = string
}

variable "master_cidr_range" {
  type    = string
  default = "10.172.0.0/28"
}

variable "machine_type" {
  type    = string
  default = "e2-standard-2"
}

variable "enable_spot" {
  type    = bool
  default = true
}

variable "enable_regional" {
  type    = bool
  default = false
}
