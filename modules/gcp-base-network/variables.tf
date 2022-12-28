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

variable "enable_default_firewall_rules" {
  type    = bool
  default = true
}

variable "enable_nat" {
  type    = bool
  default = true
}

variable "enable_secondary_ranges" {
  type    = bool
  default = true
}
