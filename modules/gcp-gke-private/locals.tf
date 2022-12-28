locals {
  zone_count = length(data.google_compute_zones.available.names) - var.zone_count < 0 ? length(data.google_compute_zones.available.names) : var.zone_count
  zones      = [for i in range(0, local.zone_count) : data.google_compute_zones.available.names[i]]
}
