# How to use

* Change S3 values 

```bash
terraform init
```
```bash
terraform plan
```
```bash
terraform apply
```
* Download CLI

    - [github releases](https://github.com/argoproj/argo-cd/releases)
    ```bash
    brew install argocd 
    ```
    ```bash
    argocd admin initial-password -n ${argocd-namespace}
    ```

## Optional 

* If you need to change the default values of variables, add them to the *terraform.tfvars* file.
* If the value of *custom_values* is *true*, don't forget to add *values_path*. You can also modify *values.yaml*.
