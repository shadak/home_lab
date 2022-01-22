terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = "2.9.3"
    }
  }
}

provider "proxmox" {
  pm_api_url = "https://10.10.10.101:8006/api2/json"
}

resource tls_private_key admin {
  algorithm    = "ECDSA"
  ecdsa_curve  = "P384"
  rsa_bits     = "4096"
}

module "monitor" {
  source = "./modules/monitor"
  count = 3

  hostname = "mon0${count.index + 1}"
  vmid = 233 + count.index 
  nameserver = "${ module.nameserver[0].ip }, ${ module.nameserver[1].ip }"
  ssh_public_keys = "${ tls_private_key.admin.public_key_pem}"
}

module "nameserver" {
  source = "./modules/nameserver"
  count = 2

  hostname = "ns0${count.index + 1}"
  vmid = 221 + count.index
  ssh_public_keys = "${ tls_private_key.admin.public_key_pem }"
  nameserver = count.index >= 1 ? "10.10.10.221, 10.10.10.254" : "10.10.10.254, 8.8.8.8"
}

module "workstation" {
  source = "./modules/workstation"

  name = "ws02"
  vmid = 152
  
  nameserver = "${ module.nameserver[0].ip }, ${ module.nameserver[1].ip }"

  user = var.admin_username
  ssh_private_key = "${ tls_private_key.admin.private_key_pem }"
  ssh_public_keys = var.endpoint_keys  
}

module "bastion" {
  source = "./modules/bastion"

  name = "bas01"
  vmid = 241
  
  nameserver = "${ module.nameserver[0].ip }, ${ module.nameserver[1].ip }"

  user = "root"
  ssh_public_keys = "${ tls_private_key.admin.public_key_pem }"
}

module wireguard {
  source = "./modules/wireguard"
  
  hostname = "wg01"
  vmid = 242
  ssh_public_keys = "${ tls_private_key.admin.public_key_pem }" 
}





