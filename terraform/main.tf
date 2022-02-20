terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = "2.9.3"
    }
  }
}

provider "proxmox" {
  pm_api_url = "https://10.20.10.21:8006/api2/json"
}

module "nameserver_cluster" {
  source = "./modules/nameserver_cluster"

  cluster_vmid = 150
  subnet = "10.20.10.0/24"
  gw = "10.20.10.1"
  ssh_public_keys = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCsYuqAVM2+0i0H6Ai+gsq51TS/9KgC9Z/g1g9X0po+SY95fofr98cI95+5dT20BuyaqXDJrE08gejWyKiLPfLzGcrMJlFV7512iyDIFUEEoCT27Fe3bEsg+WCXzxrF9yguNefPI/w5YAka5drxqlZw+wjICeuiy3VnErL4uKyizT8s67c8V4lmvayBLwN5k9nN8nNQoTVCaIwToUeo8NfxsysqBRHHZlc2ScR/kvi/2iXgcdspsi2E0B6XwV0letCM8ks4SOQE+2FatcNiAySMrlVrkgptqpvVZKpu/onNHp2Fvn3aI7gF5xuKe3dn778vKiGtISlyvKAbqiDmaSRoi531HtrsKVK2xSpsgusa6KPSensT3nQ7rVec1EOnwCXH58mQBm1tZwqfGp56D6DwmY0qbob2GZjFRxaK1mwvxZR35TMdR5ePeFyGBULZpnB8QbZt83tSWOVBJR2dgM8HMwKpfpVBTbTPm1DdMuh3ihszQ7Qr+v83nL3b81vT6a0= shadak@mgmt01"
}

module "monitor_cluster" {
  source = "./modules/monitor_cluster"

  cluster_vmid = 160
  subnet = "10.20.10.0/24"
  gw = "10.20.10.1"
  ssh_public_keys = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCsYuqAVM2+0i0H6Ai+gsq51TS/9KgC9Z/g1g9X0po+SY95fofr98cI95+5dT20BuyaqXDJrE08gejWyKiLPfLzGcrMJlFV7512iyDIFUEEoCT27Fe3bEsg+WCXzxrF9yguNefPI/w5YAka5drxqlZw+wjICeuiy3VnErL4uKyizT8s67c8V4lmvayBLwN5k9nN8nNQoTVCaIwToUeo8NfxsysqBRHHZlc2ScR/kvi/2iXgcdspsi2E0B6XwV0letCM8ks4SOQE+2FatcNiAySMrlVrkgptqpvVZKpu/onNHp2Fvn3aI7gF5xuKe3dn778vKiGtISlyvKAbqiDmaSRoi531HtrsKVK2xSpsgusa6KPSensT3nQ7rVec1EOnwCXH58mQBm1tZwqfGp56D6DwmY0qbob2GZjFRxaK1mwvxZR35TMdR5ePeFyGBULZpnB8QbZt83tSWOVBJR2dgM8HMwKpfpVBTbTPm1DdMuh3ihszQ7Qr+v83nL3b81vT6a0= shadak@mgmt01"

  nameserver = "${ module.nameserver_cluster.primary_address } ${ module.nameserver_cluster.secondary_address }"
}

module "docker_host" {
  source = "./modules/docker_host"

  hostname = "app01"
  vmid = 181
  ip = "10.20.12.11/24"
  gw = "10.20.12.1"

  ssh_public_keys = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCsYuqAVM2+0i0H6Ai+gsq51TS/9KgC9Z/g1g9X0po+SY95fofr98cI95+5dT20BuyaqXDJrE08gejWyKiLPfLzGcrMJlFV7512iyDIFUEEoCT27Fe3bEsg+WCXzxrF9yguNefPI/w5YAka5drxqlZw+wjICeuiy3VnErL4uKyizT8s67c8V4lmvayBLwN5k9nN8nNQoTVCaIwToUeo8NfxsysqBRHHZlc2ScR/kvi/2iXgcdspsi2E0B6XwV0letCM8ks4SOQE+2FatcNiAySMrlVrkgptqpvVZKpu/onNHp2Fvn3aI7gF5xuKe3dn778vKiGtISlyvKAbqiDmaSRoi531HtrsKVK2xSpsgusa6KPSensT3nQ7rVec1EOnwCXH58mQBm1tZwqfGp56D6DwmY0qbob2GZjFRxaK1mwvxZR35TMdR5ePeFyGBULZpnB8QbZt83tSWOVBJR2dgM8HMwKpfpVBTbTPm1DdMuh3ihszQ7Qr+v83nL3b81vT6a0= shadak@mgmt01"
   nameserver = "${ module.nameserver_cluster.primary_address } ${ module.nameserver_cluster.secondary_address }"
}

module "unifi_controller" {
  source = "./modules/unifi_controller"

  hostname = "uni01"
  vmid = 111
  ip = "10.20.10.11/24"
  gw = "10.20.10.1"

  ssh_public_keys = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCsYuqAVM2+0i0H6Ai+gsq51TS/9KgC9Z/g1g9X0po+SY95fofr98cI95+5dT20BuyaqXDJrE08gejWyKiLPfLzGcrMJlFV7512iyDIFUEEoCT27Fe3bEsg+WCXzxrF9yguNefPI/w5YAka5drxqlZw+wjICeuiy3VnErL4uKyizT8s67c8V4lmvayBLwN5k9nN8nNQoTVCaIwToUeo8NfxsysqBRHHZlc2ScR/kvi/2iXgcdspsi2E0B6XwV0letCM8ks4SOQE+2FatcNiAySMrlVrkgptqpvVZKpu/onNHp2Fvn3aI7gF5xuKe3dn778vKiGtISlyvKAbqiDmaSRoi531HtrsKVK2xSpsgusa6KPSensT3nQ7rVec1EOnwCXH58mQBm1tZwqfGp56D6DwmY0qbob2GZjFRxaK1mwvxZR35TMdR5ePeFyGBULZpnB8QbZt83tSWOVBJR2dgM8HMwKpfpVBTbTPm1DdMuh3ihszQ7Qr+v83nL3b81vT6a0= shadak@mgmt01"
   nameserver = "${ module.nameserver_cluster.primary_address } ${ module.nameserver_cluster.secondary_address }"
}




