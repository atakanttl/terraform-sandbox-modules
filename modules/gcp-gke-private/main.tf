data "google_compute_zones" "available" {
  project = var.project
  region  = var.region
}

data "google_client_config" "default" {}

provider "kubernetes" {
  host                   = "https://${module.gke.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.gke.ca_certificate)
}

module "gke" {
  source  = "terraform-google-modules/kubernetes-engine/google//modules/private-cluster"
  version = "24.1.0"

  name                       = "${var.prefix}-gke"
  project_id                 = var.project
  region                     = var.region
  regional                   = var.enable_regional
  zones                      = local.zones
  network                    = var.vpc_name
  subnetwork                 = var.subnet_name
  ip_range_pods              = var.secondary_range_pods_name
  ip_range_services          = var.secondary_range_services_name
  grant_registry_access      = true
  http_load_balancing        = true
  remove_default_node_pool   = true
  horizontal_pod_autoscaling = true
  enable_shielded_nodes      = false
  enable_private_nodes       = true
  enable_private_endpoint    = false
  create_service_account     = true
  master_ipv4_cidr_block     = var.master_cidr_range
  release_channel            = "REGULAR"
  node_pools = [
    {
      name           = "${var.prefix}-gke-ng"
      machine_type   = var.machine_type
      min_count      = 1
      max_count      = 1
      disk_size_gb   = 50
      auto_upgrade   = true
      spot           = var.enable_spot
      node_locations = join(",", local.zones)
      image_type     = "COS_CONTAINERD"
    }
  ]
}
