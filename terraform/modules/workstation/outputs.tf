output "terraform_inventory" {
  value       = templatefile("${path.module}/templates/ansible_inventory.tftpl", { host = proxmox_vm_qemu.workstation_vm })
  sensitive   = false
  description = "Ansible Inventory Output"
}

