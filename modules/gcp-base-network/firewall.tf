resource "google_compute_firewall" "allow_ssh_via_iap" {
  count     = var.enable_default_firewall_rules == true ? 1 : 0
  project   = var.project
  name      = "${var.prefix}-allow-ssh-via-iap"
  network   = google_compute_network.this.name
  direction = "INGRESS"
  priority  = "1000"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["35.235.240.0/20"]
}

resource "google_compute_firewall" "allow_internal" {
  count     = var.enable_default_firewall_rules == true ? 1 : 0
  project   = var.project
  name      = "${var.prefix}-allow-internal"
  network   = google_compute_network.this.name
  direction = "INGRESS"
  priority  = "1000"

  allow {
    protocol = "all"
  }

  source_ranges = [var.subnet_range]
}

resource "google_compute_firewall" "allow_health_checks" {
  count     = var.enable_default_firewall_rules == true ? 1 : 0
  project   = var.project
  name      = "${var.prefix}-allow-health-checks"
  network   = google_compute_network.this.name
  direction = "INGRESS"
  priority  = "1000"

  allow {
    protocol = "tcp"
  }

  source_ranges = ["35.191.0.0/16", "130.211.0.0/22"]
}
