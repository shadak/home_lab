variable name {
  type        = string
  default     = "bas00"
  description = "Hostname for Bastion VM"
}

variable vmid {
  type        = number
  default     = 0
  description = "Proxmox VMID"
}

variable clone_id {
  type        = string
  default     = "ubuntu-21-10-cloudinit"
  description = "Proxmox CloudInit Clone Image ID"
}

variable nameserver {
  type        = string
  default     = "8.8.8.8, 4.4.4.4"
  description = "Nameserver Addresses"
}

variable user {
  type        = string
  default     = "root"
  description = "CloudInit User Name"
}

variable password {
  type        = string
  default     = ""
  description = "CloudInit User Password"
}

variable ssh_private_key {
  type        = string
  default     = ""
  description = "SSH Private Key For Admin User"
}


variable ssh_public_keys {
  type        = string
  default     = ""
  description = "Public SSH Keys for Remote User"
}



