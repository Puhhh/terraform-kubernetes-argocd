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
    "${templatefile("${var.helm-custom-values-path}", {
      argocd-host    = var.argocd-host,
      replicas-count = var.argocd-replicas-count
    })}"
  ] : []
}

resource "kubernetes_manifest" "tls-certificate-cluster-issuer" {
  count = var.generate-tls-certificate-cluster-issuer == true ? 1 : 0

  manifest = {
    "apiVersion" = "cert-manager.io/v1"
    "kind"       = "Certificate"
    "metadata" = {
      "name"      = "${var.helm-chart-name}-tls"
      "namespace" = var.tls-certificate-namespace
    }
    "spec" = {
      "commonName" = var.argocd-host
      "dnsNames" = [
        var.argocd-host,
      ]
      "issuerRef" = {
        "kind" = "ClusterIssuer"
        "name" = var.selfsigned-cluster-issuer
      }
      "secretName" = "${var.helm-chart-name}-tls"
    }
  }
}

resource "kubernetes_manifest" "tls-certificate-files" {
  count = var.generate-tls-certificate-files == true ? 1 : 0

  manifest = {
    "apiVersion" = "v1"
    "kind"       = "Secret"
    "metadata" = {
      "name"      = "${var.helm-chart-name}-tls"
      "namespace" = var.tls-certificate-namespace
    }
    "type" = "kubernetes.io/tls"
    "data" = {
      "tls.crt" = var.tls-crt
      "tls.key" = var.tls-key
    }
  }
}

resource "kubernetes_manifest" "virtualservice" {

  manifest = {
    "apiVersion" = "networking.istio.io/v1"
    "kind"       = "VirtualService"
    "metadata" = {
      "name"      = var.argocd-server-svc
      "namespace" = kubernetes_namespace.argocd-namespace.metadata[0].name
    }
    "spec" = {
      "gateways" = [
        "${var.istio-ingress-gateway-namespace}/${var.istio-ingress-gateway-name}",
      ]
      "hosts" = [
        var.argocd-host,
      ]
      "http" = [
        {
          "match" = [
            {
              "uri" = {
                "prefix" = "/"
              }
            },
          ]
          "route" = [
            {
              "destination" = {
                "host" = "${var.argocd-server-svc}.${kubernetes_namespace.argocd-namespace.metadata[0].name}.svc.cluster.local"
                "port" = {
                  "number" = 80
                }
              }
            },
          ]
        },
      ]
    }
  }
}

locals {
  patch_command = <<-EOT
  kubectl patch gateways.networking.istio.io ${var.istio-ingress-gateway-name} -n ${var.istio-ingress-gateway-namespace} --type='json' -p='[{"op": "add", "path": "/spec/servers/-", "value": {
    "hosts": ["${var.argocd-host}"], 
    "port": {
      "name": "${var.helm-name}", 
      "number": 443, 
      "protocol": "HTTPS"
    }, 
    "tls": {
      "credentialName": "${var.helm-chart-name}-tls", 
      "mode": "SIMPLE"
    }
    }}]'
  EOT
}

resource "null_resource" "patch_gateway" {
  provisioner "local-exec" {
    command = local.patch_command
  }
}
