output "prefix" {
  value = local.prefix
}

output "vpc_name" {
  value = google_compute_network.this.name
}

output "subnet_name" {
  value = google_compute_subnetwork.this.name
}

output "subnet_cidr" {
  value = google_compute_subnetwork.this.ip_cidr_range
}

output "secondary_range_pods_name" {
  value = var.enable_secondary_ranges == true ? google_compute_subnetwork.this.secondary_ip_range[0].range_name : null
}

output "secondary_range_pods_cidr" {
  value = var.enable_secondary_ranges == true ? google_compute_subnetwork.this.secondary_ip_range[0].ip_cidr_range : null
}

output "secondary_range_services_name" {
  value = var.enable_secondary_ranges == true ? google_compute_subnetwork.this.secondary_ip_range[1].range_name : null
}

output "secondary_range_services_cidr" {
  value = var.enable_secondary_ranges == true ? google_compute_subnetwork.this.secondary_ip_range[1].ip_cidr_range : null
}
