variable cluster_vmid {
  type        = number
  default     = 150
  description = "VMID Base for Monitor Cluster"
}

variable subnet {
  type        = string
  default     = "10.20.10.0/24"
  description = "Base IP for Monitor Cluster"
}

variable gw {
  type        = string
  default     = "10.20.10.1"
  description = "Gateway for Monitor Cluster"
}

variable ssh_public_keys {
  type        = string
  default     = ""
  description = "SSH Public Keys for Monitor Cluster"
}

variable nameserver {
  type        = string
  default     = "4.4.4.4 8.8.8.8"
  description = "Nameserver list for Monitor Cluster"
  sensitive = false
}


