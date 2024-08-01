variable "project_id" {
  description = "The ID of the GCP project to deploy to"
  type        = string
}

variable "region" {
  description = "The region to deploy the GKE cluster in"
  type        = string
  default     = "us-central1"
}
