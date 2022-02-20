output primary_address {
  value       = replace(proxmox_lxc.primary_pihole.network[0].ip, "/${"/"}.*$/", "")
  sensitive   = false
  description = "Primary Pihole Address"
  depends_on  = []
}

output secondary_address {
  value       = replace(proxmox_lxc.secondary_pihole.network[0].ip, "/${"/"}.*$/", "")
  sensitive   = false
  description = "Secondary Pihole Address"
  depends_on  = []
}

