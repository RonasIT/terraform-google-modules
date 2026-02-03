locals {
  vms_with_static_ip = {
    for vm in var.vms : vm.name => vm
    if vm.assign_static_ip
  }

  ssh_keys_metadata = {
    for vm in var.vms : vm.name => (
      length(vm.ssh_keys) > 0 ? join("\n", [for ssh_key in vm.ssh_keys : "${ssh_key.user}:${ssh_key.key}"]) :
      length(var.ssh_keys) > 0 ? join("\n", [for ssh_key in var.ssh_keys : "${ssh_key.user}:${ssh_key.key}"]) :
      length(var.ssh_public_keys) > 0 ? join("\n", [for key in var.ssh_public_keys : "${var.default_ssh_user}:${key}"]) :
      ""
    )
  }

  firewall_prefix = var.project_id != "" ? "${var.project_id}-" : ""
}

resource "google_compute_address" "vm_static_ip" {
  for_each = local.vms_with_static_ip

  name        = each.value.static_ip_name
  project     = var.project_id
  region      = var.region
  description = "Static IP for VM instance: ${each.value.name}"

  labels = merge(
    var.labels,
    {
      vm_name    = each.value.name
      managed_by = "terraform"
    }
  )
}

resource "google_compute_instance" "vm_instance" {
  for_each = { for vm in var.vms : vm.name => vm }

  project                   = var.project_id
  zone                      = var.zone
  name                      = each.value.name
  machine_type              = each.value.machine_type
  tags                      = [var.network_tag]
  allow_stopping_for_update = true
  description               = "Managed by Terraform - VM instance: ${each.value.name}"

  boot_disk {
    initialize_params {
      image = each.value.source_image
      size  = each.value.disk_size_gb
      type  = each.value.disk_type

      labels = merge(
        var.labels,
        {
          vm_name    = each.value.name
          managed_by = "terraform"
        }
      )
    }
  }

  network_interface {
    network    = var.network
    subnetwork = var.subnetwork_self_link

    dynamic "access_config" {
      for_each = each.value.assign_static_ip ? [1] : []
      content {
        nat_ip = google_compute_address.vm_static_ip[each.value.name].address
      }
    }
  }

  metadata = merge(
    local.ssh_keys_metadata[each.value.name] != "" ? {
      ssh-keys = local.ssh_keys_metadata[each.value.name]
    } : {},
    each.value.startup_script != "" ? {
      startup-script = each.value.startup_script
    } : {}
  )

  service_account {
    email  = var.service_account_email
    scopes = ["cloud-platform"]
  }

  labels = merge(
    var.labels,
    {
      vm_name    = each.value.name
      managed_by = "terraform"
    }
  )

  lifecycle {
    prevent_destroy = true
  }
}

resource "google_compute_firewall" "vm_custom_ingress" {
  for_each = {
    for rule_key, rule_value in flatten([
      for vm in var.vms : [
        for rule_index, rule in vm.ingress_rules : {
          vm_name = vm.name
          rule    = rule
          key     = "${local.firewall_prefix}${vm.name}-ingress-${rule_index}"
        }
      ]
    ]) : rule_value.key => rule_value
  }

  name        = each.key
  network     = var.network
  project     = var.project_id
  description = "Ingress rule for VM: ${each.value.vm_name} - Protocol: ${each.value.rule.protocol}"

  allow {
    protocol = each.value.rule.protocol
    ports    = each.value.rule.ports
  }

  direction     = "INGRESS"
  source_ranges = each.value.rule.source_ranges
  target_tags   = [var.network_tag]

  labels = merge(
    var.labels,
    {
      vm_name    = each.value.vm_name
      managed_by = "terraform"
      rule_type  = "ingress"
    }
  )
}

resource "google_compute_firewall" "vm_custom_egress" {
  for_each = {
    for rule_key, rule_value in flatten([
      for vm in var.vms : [
        for rule_index, rule in vm.egress_rules : {
          vm_name = vm.name
          rule    = rule
          key     = "${local.firewall_prefix}${vm.name}-egress-${rule_index}"
        }
      ]
    ]) : rule_value.key => rule_value
  }

  name        = each.key
  network     = var.network
  project     = var.project_id
  description = "Egress rule for VM: ${each.value.vm_name} - Protocol: ${each.value.rule.protocol}"

  allow {
    protocol = each.value.rule.protocol
    ports    = each.value.rule.ports
  }

  direction          = "EGRESS"
  destination_ranges = each.value.rule.destination_ranges
  target_tags        = [var.network_tag]

  labels = merge(
    var.labels,
    {
      vm_name    = each.value.vm_name
      managed_by = "terraform"
      rule_type  = "egress"
    }
  )
}
