terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = "2.9.3"
    }
  }
}

resource "proxmox_lxc" "docker_host" {
  target_node = "px01"
  hostname = var.hostname
  vmid = var.vmid
  ostemplate = "local:vztmpl/ubuntu-20.04-standard_20.04-1_amd64.tar.gz"
  onboot = false

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
    ip = var.ip
    gw = var.gw
  }
  nameserver = var.nameserver
}
