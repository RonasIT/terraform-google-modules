<!-- BEGIN_TF_DOCS -->


## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_nginx-controller"></a> [nginx-controller](#module\_nginx-controller) | terraform-iaac/nginx-controller/helm | ~>2.2.2 |

## Resources

| Name | Type |
|------|------|
| [google_compute_address.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_address) | resource |
| [google_client_config.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_set"></a> [additional\_set](#input\_additional\_set) | Optional set for additional helm settings | <pre>list(<br/>    object(<br/>      {<br/>        name  = string<br/>        value = string<br/>        type  = optional(string)<br/>      }<br/>    )<br/>  )</pre> | <pre>[<br/>  {<br/>    "name": "controller.resources.limits.cpu",<br/>    "type": "string",<br/>    "value": "125m"<br/>  },<br/>  {<br/>    "name": "controller.resources.limits.memory",<br/>    "type": "string",<br/>    "value": "175Mi"<br/>  },<br/>  {<br/>    "name": "controller.config.proxy-body-size",<br/>    "type": "string",<br/>    "value": "100m"<br/>  },<br/>  {<br/>    "name": "controller.addHeaders.x-robots-tag",<br/>    "type": "string",<br/>    "value": "noindex"<br/>  }<br/>]</pre> | no |
| <a name="input_atomic"></a> [atomic](#input\_atomic) | If set, installation process purges chart on fail | `bool` | `true` | no |
| <a name="input_ca_certificate"></a> [ca\_certificate](#input\_ca\_certificate) | The CA certificate of the Kubernetes cluster | `string` | n/a | yes |
| <a name="input_chart_version"></a> [chart\_version](#input\_chart\_version) | The version of Helm chart | `string` | `"4.13"` | no |
| <a name="input_cluster_issuer_name"></a> [cluster\_issuer\_name](#input\_cluster\_issuer\_name) | The name of the cluster issuer (CertManager) | `string` | n/a | yes |
| <a name="input_controller_kind"></a> [controller\_kind](#input\_controller\_kind) | Controller type: DaemonSet, Deployment etc.. | `string` | `"DaemonSet"` | no |
| <a name="input_create_namespace"></a> [create\_namespace](#input\_create\_namespace) | Create a namespace | `bool` | `true` | no |
| <a name="input_endpoint"></a> [endpoint](#input\_endpoint) | The endpoint of the Kubernetes cluster | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of helm release | `string` | `"ingress-nginx"` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Name of namespace where nginx controller should be deployed | `string` | `"ingress-nginx"` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Prefix for all resources | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The project ID to deploy | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The region of the Kubernetes cluster | `string` | `""` | no |
<!-- END_TF_DOCS -->