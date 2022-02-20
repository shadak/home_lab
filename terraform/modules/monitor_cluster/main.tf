terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = "2.9.3"
    }
  }
}


resource "proxmox_lxc" "grafana_container" {
  target_node = "px01"
  hostname = "mon01"
  vmid = var.cluster_vmid + 1
  ostemplate = "local:vztmpl/ubuntu-21.10-standard_21.10-1_amd64.tar.zst"
  onboot = true

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
    ip = "${cidrhost(var.subnet, 61)}/24"
    gw = var.gw
  }
  nameserver = var.nameserver
}

resource "proxmox_lxc" "prometheus_container" {
  target_node = "px01"
  hostname = "mon02" 
  vmid = var.cluster_vmid + 2
  ostemplate = "local:vztmpl/ubuntu-21.10-standard_21.10-1_amd64.tar.zst"
  onboot = true

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
    ip = "${cidrhost(var.subnet, 62)}/24"
    gw = var.gw
  }
  nameserver = var.nameserver
}


