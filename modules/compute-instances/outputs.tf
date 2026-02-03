output "instance_ids" {
  description = "Map of VM names to their instance IDs"
  value = {
    for name, instance in google_compute_instance.vm_instance :
    name => instance.id
  }
}

output "instance_self_links" {
  description = "Map of VM names to their self links"
  value = {
    for name, instance in google_compute_instance.vm_instance :
    name => instance.self_link
  }
}

output "instance_names" {
  description = "List of VM instance names"
  value = [
    for name, instance in google_compute_instance.vm_instance :
    instance.name
  ]
}

output "internal_ips" {
  description = "Map of VM names to their internal IP addresses"
  value = {
    for name, instance in google_compute_instance.vm_instance :
    name => instance.network_interface[0].network_ip
  }
}

output "external_ips" {
  description = "Map of VM names to their external IP addresses (if any)"
  value = {
    for name, instance in google_compute_instance.vm_instance :
    name => try(instance.network_interface[0].access_config[0].nat_ip, null)
  }
}

output "static_ips" {
  description = "Map of VM names to their static IP addresses"
  value = {
    for name, ip in google_compute_address.vm_static_ip :
    name => ip.address
  }
}

output "instance_zones" {
  description = "Map of VM names to their zones"
  value = {
    for name, instance in google_compute_instance.vm_instance :
    name => instance.zone
  }
}

output "instance_external_ips" {
  description = "List of external IP addresses (for backward compatibility)"
  value = [
    for vm_ip in google_compute_address.vm_static_ip :
    vm_ip.address
  ]
}

output "network_tag" {
  description = "The network tag used for the VMs"
  value       = var.network_tag
}
