locals {
  zone = var.zone != null ? var.zone : data.google_compute_zones.available.names[random_integer.zone_index.result]
}
