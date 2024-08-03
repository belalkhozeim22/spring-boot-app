variable "project_id" {
  description = "The ID of the GCP project to deploy to"
  type        = string
}

variable "region" {
  description = "The region to deploy the GKE cluster in"
  type        = string
}

variable "cluster_name" {
  description = "The name of the GKE cluster"
  type        = string
}

variable "node_pool" {
  description = "Node pool configurations"
  type = map(object({
    node_count   = number
    machine_type = string
  }))
}


variable "network" {
  description = "The VPC network to host the GKE cluster."
  type        = string
}

variable "subnetwork" {
  description = "The subnetwork to host the GKE cluster."
  type        = string
}