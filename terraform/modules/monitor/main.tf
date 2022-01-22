terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
    }
  }
}


resource "proxmox_lxc" "service_container" {
  target_node = "px01"
  hostname = var.hostname 
  vmid = var.vmid
  ostemplate = "local:vztmpl/ubuntu-21.10-standard_21.10-1_amd64.tar.zst"
  onboot = var.onboot

  cores = 1
  memory = 1024

  rootfs {
    storage = "local-lvm"
    size = "8G"
  }

  ssh_public_keys = var.ssh_public_keys
  
  network {
    name = "eth0"
    bridge = "vmbr0"
    ip = "10.10.10.${var.vmid}/24"
    gw = "10.10.10.254"
  }
  nameserver = var.nameserver
}
