output "terraform_inventory" {
  value = templatefile("${path.module}/templates/ansible_inventory.tftpl", { host = proxmox_lxc.service_container }) 
  sensitive = false
}

