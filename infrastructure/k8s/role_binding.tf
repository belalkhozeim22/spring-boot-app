resource "kubernetes_cluster_role_binding" "pipeline" {
  metadata {
    name = "azure-pipelines-binding"
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "cluster-admin"
  }

  subject {
    kind      = "ServiceAccount"
    name      = kubernetes_service_account.pipeline.azure-pipelines-sa
    namespace = kubernetes_service_account.pipeline.default
  }
}
