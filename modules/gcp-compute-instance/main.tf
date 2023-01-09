data "google_compute_zones" "available" {
  project = var.project
  region  = var.region
}

resource "random_integer" "zone_index" {
  min = 0
  max = length(data.google_compute_zones.available.names) - 1
}

resource "google_compute_instance" "this" {
  project      = var.project
  name         = "${var.prefix}-instance"
  machine_type = var.machine_type
  zone         = local.zone

  boot_disk {
    initialize_params {
      image = var.image_name
      size  = var.disk_size_gb
    }
  }

  network_interface {
    network    = var.vpc_name
    subnetwork = var.subnet_name

    dynamic "access_config" {
      for_each = var.enable_public_ip == true ? [1] : []
      content {}
    }
  }

  service_account {
    scopes = ["cloud-platform"]
  }

  shielded_instance_config {
    enable_secure_boot = true
  }

  scheduling {
    preemptible        = var.enable_spot == true ? true : false
    provisioning_model = var.enable_spot == true ? "SPOT" : "STANDARD"
    automatic_restart  = var.enable_spot == true ? false : true
  }
}
