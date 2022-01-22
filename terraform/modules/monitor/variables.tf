variable hostname {
  type        = string
  default     = "mon00"
  description = "Monitor Container Host Name"
}


variable "vmid" {
  type = number
  default = 100
}

variable "onboot" {
  type = bool
  default = false
}

variable ssh_public_keys {
  type        = string
  default     = ""
  description = "SSH Public Keys For Remote Access"
}

variable nameserver {
  type        = string
  default     = "10.10.10.254, 8.8.8.8"
  description = "Nameserver List for Monitor Container"
}
