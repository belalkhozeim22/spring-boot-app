variable "project_id" {
  type        = string
  description = "The ID of the GCP project"
}

variable "region" {
  type        = string
  description = "The region of the GCP project"
}

variable "location" {
  description = "GCP Zone"
  type        = string
}

variable "cluster_name" {
  type        = string
  description = "The name of the GKE cluster"
}

variable "node_pool" {
  description = "The configuration of the node pools"
  type = map(object({
    node_count   = number
    machine_type = string
  }))
}

variable "network" {
  type        = string
  description = "The name of the network"
}

variable "subnetwork" {
  type        = string
  description = "The name of the subnetwork"
}
