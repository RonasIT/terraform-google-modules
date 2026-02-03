<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | ~> 5.0 |

## Resources

| Name | Type |
|------|------|
| [google_compute_address.vm_static_ip](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_address) | resource |
| [google_compute_firewall.vm_custom_egress](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_firewall.vm_custom_ingress](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_instance.vm_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_default_ssh_user"></a> [default\_ssh\_user](#input\_default\_ssh\_user) | Default SSH user for backward compatibility when using ssh\_public\_keys | `string` | `"ubuntu"` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | Labels to apply to all resources created by this module | `map(string)` | `{}` | no |
| <a name="input_network"></a> [network](#input\_network) | The network to deploy the instances in. | `string` | n/a | yes |
| <a name="input_network_tag"></a> [network\_tag](#input\_network\_tag) | Tag used to identify the VM instances for firewall rules. | `string` | `"vms"` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The project ID to deploy the resources in. | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The region where the static IPs will be created. | `string` | n/a | yes |
| <a name="input_service_account_email"></a> [service\_account\_email](#input\_service\_account\_email) | Email of the service account to attach to the VMs. | `string` | n/a | yes |
| <a name="input_ssh_keys"></a> [ssh\_keys](#input\_ssh\_keys) | Global SSH keys to add to all VMs (unless overridden by per-VM keys) | <pre>list(object({<br/>    user = string<br/>    key  = string<br/>  }))</pre> | `[]` | no |
| <a name="input_ssh_public_keys"></a> [ssh\_public\_keys](#input\_ssh\_public\_keys) | List of SSH public keys to add to all VMs with default user (backward compatibility) | `list(string)` | `[]` | no |
| <a name="input_subnetwork_self_link"></a> [subnetwork\_self\_link](#input\_subnetwork\_self\_link) | The self-link of the subnetwork to use. | `string` | n/a | yes |
| <a name="input_vms"></a> [vms](#input\_vms) | A list of objects defining the VMs to create. | <pre>list(object({<br/>    name             = string<br/>    machine_type     = string<br/>    disk_size_gb     = number<br/>    disk_type        = string<br/>    source_image     = string<br/>    assign_static_ip = bool<br/>    static_ip_name   = optional(string)<br/>    startup_script   = string<br/>    ssh_keys = optional(list(object({<br/>      user = string<br/>      key  = string<br/>    })), [])<br/>    ingress_rules = optional(list(object({<br/>      protocol      = string<br/>      ports         = list(string)<br/>      source_ranges = list(string)<br/>    })), [])<br/>    egress_rules = optional(list(object({<br/>      protocol           = string<br/>      ports              = list(string)<br/>      destination_ranges = list(string)<br/>    })), [])<br/>  }))</pre> | n/a | yes |
| <a name="input_zone"></a> [zone](#input\_zone) | The zone where the instances will be deployed. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_external_ips"></a> [external\_ips](#output\_external\_ips) | Map of VM names to their external IP addresses (if any) |
| <a name="output_instance_external_ips"></a> [instance\_external\_ips](#output\_instance\_external\_ips) | List of external IP addresses (for backward compatibility) |
| <a name="output_instance_ids"></a> [instance\_ids](#output\_instance\_ids) | Map of VM names to their instance IDs |
| <a name="output_instance_names"></a> [instance\_names](#output\_instance\_names) | List of VM instance names |
| <a name="output_instance_self_links"></a> [instance\_self\_links](#output\_instance\_self\_links) | Map of VM names to their self links |
| <a name="output_instance_zones"></a> [instance\_zones](#output\_instance\_zones) | Map of VM names to their zones |
| <a name="output_internal_ips"></a> [internal\_ips](#output\_internal\_ips) | Map of VM names to their internal IP addresses |
| <a name="output_network_tag"></a> [network\_tag](#output\_network\_tag) | The network tag used for the VMs |
| <a name="output_static_ips"></a> [static\_ips](#output\_static\_ips) | Map of VM names to their static IP addresses |
<!-- END_TF_DOCS -->