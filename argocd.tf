resource "kubernetes_namespace" "argocd-namespace" {
  metadata {
    name = var.argocd-namespace
  }
}

resource "helm_release" "argocd" {
  namespace  = kubernetes_namespace.argocd-namespace.metadata[0].name
  name       = var.helm-name
  chart      = var.helm-chart-name
  repository = var.helm-chart-repo
  version    = var.helm-chart-version

  values = var.helm-custom-values ? [
    templatefile(var.helm-custom-values-path, {
      argocd-host    = var.argocd-host,
      configmap-name = var.configmap-name,
    })
  ] : []
}
