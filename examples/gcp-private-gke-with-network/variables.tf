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
  default = "10.0.0.0/16"
}

variable "secondary_range_pods" {
  type    = string
  default = "10.1.0.0/19"
}

variable "secondary_range_services" {
  type    = string
  default = "10.2.0.0/22"
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
