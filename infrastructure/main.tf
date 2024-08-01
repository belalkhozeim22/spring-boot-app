module "gke" {
  source = "./modules/gke"

  project_id = var.project_id
  region     = var.region
  cluster_name = "gke-cluster"
  node_pool = {
    dev = {
      node_count = 1
      machine_type = "e2-medium"
    }
    prod = {
      node_count = 3
      machine_type = "e2-medium"
    }
  }
}
