resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.location
  #region = var.region
  network    = var.network
  subnetwork = var.subnetwork

  remove_default_node_pool = true

  initial_node_count = 1

  node_config {
    machine_type = "e2-small"
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }
}

resource "google_container_node_pool" "dev_node_pool" {
  name       = "dev-node-pool"
  cluster    = google_container_cluster.primary.name
  location   = google_container_cluster.primary.location
  node_count = var.node_pool["dev"]["node_count"]

  node_config {
    machine_type = var.node_pool["dev"]["machine_type"]
    disk_size_gb = 10
    labels = {
      nodepool = "dev"
    }
  }

  management {
    auto_repair  = true
    auto_upgrade = true
  }
}

resource "google_container_node_pool" "prod_node_pool" {
  name       = "prod-node-pool"
  cluster    = google_container_cluster.primary.name
  location   = google_container_cluster.primary.location
  node_count = var.node_pool["prod"]["node_count"]

  node_config {
    machine_type = var.node_pool["prod"]["machine_type"]
    disk_size_gb = 10
    labels = {
      nodepool = "prod"
    }
  }

  management {
    auto_repair  = true
    auto_upgrade = true
  }
}
