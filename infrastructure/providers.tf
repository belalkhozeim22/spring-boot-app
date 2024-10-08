terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}

provider "google" {
  #credentials = file("~/Downloads/spring-boot-project-431122-499adffcb48c.json")
  project     = var.project_id
  region      = var.region
}
