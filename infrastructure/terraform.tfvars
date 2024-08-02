project_id  = "your-gcp-project-id"
region      = "us-central1"
cluster_name = "gke-cluster"

node_pool = {
  dev = {
    node_count   = 1
    machine_type = "e2-medium"
  }
  prod = {
    node_count   = 3
    machine_type = "e2-medium"
  }
}
