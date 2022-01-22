variable "vmid" {
  type = number
  default = 100
}

variable "onboot" {
  type = bool
  default = false
}

variable nameserver {
  type        = string
  default     = "10.10.10.254, 8.8.8.8"
  description = "Nameserver List for Nameserver Container"
}

variable hostname {
  type        = string
  default     = "ns00"
  description = "Nameserver Container Hostname"
}

variable ssh_public_keys {
  type        = string
  default     = ""
  description = "SSH Public Keys For Remote Access"
}


