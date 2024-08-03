terraform {
  backend "gcs" {
    bucket = "spring-boot-terraform"
    prefix = "terraform/state"
  }
}