module "network" {
  source = "../../modules/gcp-base-network"

  project = var.project
  region  = var.region
  prefix  = var.prefix

  subnet_range             = var.subnet_range
  secondary_range_pods     = var.secondary_range_pods
  secondary_range_services = var.secondary_range_services
}

module "gke" {
  source = "../../modules/gcp-compute-instance"

  project = var.project
  region  = var.region
  prefix  = var.prefix

  vpc_name                      = module.network.vpc_name
  subnet_name                   = module.network.subnet_name
  secondary_range_pods_name     = module.network.secondary_range_pods_name
  secondary_range_services_name = module.network.secondary_range_services_name
  master_cidr_range             = var.master_cidr_range
}

module "compute_instance" {
  source = "../modules/gcp-compute-instance"

  project = var.project
  region  = var.region
  prefix  = var.prefix

  vpc_name    = module.network.vpc_name
  subnet_name = module.network.subnet_name

  enable_public_ip = true
  enable_spot      = var.enable_spot
  image_name       = var.image_name
  disk_size_gb     = var.disk_size_gb
  machine_type     = var.machine_type
}
