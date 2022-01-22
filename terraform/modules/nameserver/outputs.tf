output "terraform_inventory" {
  value       = templatefile("${path.module}/templates/ansible_inventory.tftpl", { host = proxmox_lxc.service_container })
  sensitive = false
}

output ip {
  value       = "10.10.10.${var.vmid}"
  sensitive   = true
  description = "Nameserver IP Address"
  depends_on  = []
}

