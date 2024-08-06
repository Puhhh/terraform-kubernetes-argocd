variable "kubeconfig-path" {
  description = "Kubeconfig Path"
  type        = string
  default     = "~/.kube/config"
}

variable "argocd-namespace" {
  description = "ArgoCD Namespace"
  type        = string
  default     = "argocd"
}

variable "helm-name" {
  description = "Helm Release Name"
  type        = string
  default     = "argocd"
}

variable "helm-chart-name" {
  description = "Helm Chart Name"
  type        = string
  default     = "argo-cd"
}

variable "helm-chart-repo" {
  description = "Helm Chart Repo"
  type        = string
  default     = "https://argoproj.github.io/argo-helm"
}

variable "helm-chart-version" {
  description = "Helm Chart Version"
  type        = string
  default     = "7.4.0"
}

variable "helm-custom-values" {
  description = "Use Helm Custom Values"
  type        = bool
  default     = false
}

variable "helm-custom-values-path" {
  description = "Helm Custom Values Path"
  type        = string
  default     = ""
}

variable "argocd-host" {
  description = "ArgoCD Server URL"
  type        = string
  default     = "argocd.example.com"
}

variable "argocd-replicas-count" {
  description = "ArgoCD Replicas Count"
  type        = number
  default     = 1
}

variable "generate-tls-certificate" {
  description = "Generate TLS Certificate"
  type        = bool
  default     = false
}

variable "tls-certificate-namespace" {
  description = "TLS Certificate Namespace"
  type        = string
  default     = "istio-ingress"
}

variable "selfsigned-cluster-issuer" {
  description = "Selfsigned Cluster Issuer"
  type        = string
  default     = "selfsigned-cluster-issuer"
}

variable "istio-ingress-gateway-namespace" {
  description = "Istio Ingress Gateway namespace"
  type        = string
  default     = "istio-ingress"
}

variable "istio-ingress-gateway-name" {
  description = "Istio Ingress Gateway Name"
  type        = string
  default     = "gateway"
}

variable "argocd-server-svc" {
  description = "Argocd Server Service Name"
  type        = string
  default     = "argocd-server"
}
