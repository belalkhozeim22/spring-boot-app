project_id  = "spring-boot-project-431122"
region      = "us-central1"
cluster_name = "deployment-cluster"

node_pool = {
  dev = {
    node_count   = 1
    machine_type = "e2-small"
  }
  prod = {
    node_count   = 3
    machine_type = "e2-small"
  }
}

network    = "main-vpc"
subnetwork = "main-subnet"