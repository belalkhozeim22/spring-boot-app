resource "kubernetes_service_account" "pipeline" {
  metadata {
    name      = "azure-pipelines-sa"
    namespace = "default"
  }
}
