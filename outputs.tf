output "tls-name" {
  value = helm_release.argocd.name
}

output "server-svc-namemespace" {
  value = kubernetes_namespace.argocd-namespace.metadata[0].name
}
