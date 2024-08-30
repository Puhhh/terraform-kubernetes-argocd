<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | 2.15.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.32.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.argocd](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_namespace.argocd-namespace](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_argocd-host"></a> [argocd-host](#input\_argocd-host) | ArgoCD Server URL | `string` | n/a | yes |
| <a name="input_argocd-namespace"></a> [argocd-namespace](#input\_argocd-namespace) | ArgoCD Namespace | `string` | `"argocd"` | no |
| <a name="input_argocd-replicas-count"></a> [argocd-replicas-count](#input\_argocd-replicas-count) | ArgoCD Replicas Count | `number` | `1` | no |
| <a name="input_configmap-name"></a> [configmap-name](#input\_configmap-name) | Config Map with CA Certificates Bundle Name | `string` | n/a | yes |
| <a name="input_helm-chart-name"></a> [helm-chart-name](#input\_helm-chart-name) | Helm Chart Name | `string` | `"argo-cd"` | no |
| <a name="input_helm-chart-repo"></a> [helm-chart-repo](#input\_helm-chart-repo) | Helm Chart Repo | `string` | `"https://argoproj.github.io/argo-helm"` | no |
| <a name="input_helm-chart-version"></a> [helm-chart-version](#input\_helm-chart-version) | Helm Chart Version | `string` | `"7.4.0"` | no |
| <a name="input_helm-custom-values"></a> [helm-custom-values](#input\_helm-custom-values) | Use Helm Custom Values | `bool` | `false` | no |
| <a name="input_helm-custom-values-path"></a> [helm-custom-values-path](#input\_helm-custom-values-path) | Helm Custom Values Path | `string` | `""` | no |
| <a name="input_helm-name"></a> [helm-name](#input\_helm-name) | Helm Release Name | `string` | `"argocd"` | no |
| <a name="input_kubeconfig-path"></a> [kubeconfig-path](#input\_kubeconfig-path) | Kubeconfig Path | `string` | `"~/.kube/config"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
