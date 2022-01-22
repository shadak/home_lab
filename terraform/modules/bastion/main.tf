terraform {
    required_providers {
        proxmox = {
            source = "telmate/proxmox"
        }
    }
}

resource "proxmox_vm_qemu" "bastion_vm" {
    target_node = "px01"
    name = var.name
    vmid = var.vmid

    os_type = "cloud-init"
    clone = var.clone_id

    cores = 2
    sockets = 1
    memory = 1024
 
    network {
        model = "virtio"
        bridge = "vmbr0"
    }

    disk {
        type = "virtio"
        storage = "local-lvm"
        size = "8GB"
    }

   
    ipconfig0 = "ip=10.10.10.${var.vmid}/24,gw=10.10.10.254"
    nameserver = var.nameserver

    
    ciuser = var.user
    cipassword = var.password
    sshkeys = var.ssh_public_keys
    ssh_private_key = var.ssh_private_key
}
