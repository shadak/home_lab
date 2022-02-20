variable vmid {
  type        = number
  default     = 110
  description = "Proxmox VMID"
}

variable ip {
  type        = string
  default     = "10.20.10.10/24"
  description = "IP Address for Unifi Controller"
}

variable gw {
  type        = string
  default     = "10.20.12.1"
  description = "Gateway Address for Unifi Controller"
}

variable ssh_public_keys {
  type        = string
  default     = ""
  description = "SSH Public Keys for Unifi Controller"
}

variable nameserver {
  type        = string
  default     = "4.4.4.4,8.8.8.8"
  description = "Nameserver list for Unifi Controller"
}

variable hostname {
  type        = string
  default     = "uni00"
  description = "Hostname for Unifi Controller"
}
