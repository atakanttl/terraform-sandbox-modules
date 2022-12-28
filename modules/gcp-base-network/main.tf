resource "google_compute_network" "this" {
  project                 = var.project
  name                    = "${var.prefix}-vpc"
  auto_create_subnetworks = false
  mtu                     = 1460
  routing_mode            = "REGIONAL"
}

resource "google_compute_subnetwork" "this" {
  project                  = var.project
  name                     = "${var.prefix}-subnet"
  ip_cidr_range            = var.subnet_range
  region                   = var.region
  network                  = google_compute_network.this.name
  private_ip_google_access = true
  secondary_ip_range = var.enable_secondary_ranges == true ? [
    {
      ip_cidr_range = var.secondary_range_pods
      range_name    = "${var.prefix}-secondary-range-pods"
    },
    {
      ip_cidr_range = var.secondary_range_services
      range_name    = "${var.prefix}-secondary-range-services"
    }
  ] : []
}

resource "google_compute_router" "this" {
  count   = var.enable_nat == true ? 1 : 0
  project = var.project
  name    = "${var.prefix}-router"
  region  = var.region
  network = google_compute_network.this.name
}

resource "google_compute_router_nat" "this" {
  count                              = var.enable_nat == true ? 1 : 0
  project                            = var.project
  name                               = "${var.prefix}-nat"
  router                             = google_compute_router.this[count.index].name
  region                             = google_compute_router.this[count.index].region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}
