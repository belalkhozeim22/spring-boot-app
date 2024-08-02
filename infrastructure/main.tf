module "gke" {
  source       = "./gke/modules/gke-cluster"
  project_id   = var.project_id
  region       = var.region
  cluster_name = var.cluster_name
  node_pool    = var.node_pool
}
