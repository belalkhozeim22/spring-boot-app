
resource "google_compute_network" "vpc_network" {
  name                    = "terraform-vpc"
  auto_create_subnetworks = false
}

# Create a Subnet
resource "google_compute_subnetwork" "subnetwork" {
  name          = "terraform-subnet"
  ip_cidr_range = "10.0.0.0/16"
  region        = var.region
  network       = google_compute_network.vpc_network.id
}

module "gke" {
  source       = "./k8s/modules/gke"
  project_id   = var.project_id
  region       = var.region
  cluster_name = var.cluster_name
  node_pool    = var.node_pool
  network      = google_compute_network.vpc_network.name
  subnetwork   = google_compute_subnetwork.subnetwork.name
}
