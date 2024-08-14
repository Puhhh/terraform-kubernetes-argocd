module "istio-network" {
  source = "github.com/Puhhh/terraform-istio-network"

  tls-name                        = helm_release.argocd.name
  server-url                      = var.argocd-host
  tls-certificate-cluster-issuer  = true
  selfsigned-cluster-issuer       = "ca-issuer"
  istio-ingress-gateway-namespace = "istio-ingress"
  istio-ingress-gateway-name      = "gateway"
  server-svc-name                 = "argocd-server"
  server-svc-namemespace          = kubernetes_namespace.argocd-namespace.metadata[0].name
  destination-port                = 80
}
