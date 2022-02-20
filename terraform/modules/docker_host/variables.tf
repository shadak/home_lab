variable vmid {
  type        = number
  default     = 100
  description = "Proxmox VMID"
}

variable ip {
  type        = string
  default     = "10.20.12.11/24"
  description = "IP Address for Docker Host"
}

variable gw {
  type        = string
  default     = "10.20.12.1"
  description = "Gateway Address for Docker Host"
}

variable ssh_public_keys {
  type        = string
  default     = ""
  description = "SSH Public Keys for Docker Host"
}

variable nameserver {
  type        = string
  default     = "4.4.4.4,8.8.8.8"
  description = "Nameserver list for Docker Host"
}

variable hostname {
  type        = string
  default     = "app00"
  description = "Hostname for Docker Host"
}
