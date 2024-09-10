variable "kubeconfig-path" {
  description = "Kubeconfig Path"
  type        = string
  default     = "~/.kube/config"
}

variable "kube-context" {
  description = "Kubernetes Context to Use"
  type        = string
  default     = ""
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

  validation {
    condition     = !(var.helm-custom-values && var.helm-custom-values-path == "")
    error_message = "helm-custom-values-path must not be null when helm-custom-values is true."
  }
}

variable "argocd-host" {
  description = "ArgoCD Server URL"
  type        = string
}

variable "configmap-name" {
  description = "Config Map with CA Certificates Bundle Name"
  type        = string
  default     = ""
}
