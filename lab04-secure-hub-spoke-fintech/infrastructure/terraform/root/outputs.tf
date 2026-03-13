# =============================================================================
# OUTPUTS - Values exposed for other modules or CI
# =============================================================================

# =============================================================================
# Resource Group
# =============================================================================

output "resource_group_name" {
  description = "Name of the created resource group"
  value       = module.resource_group.name
}

# =============================================================================
# Hub VNet
# =============================================================================

output "hub_vnet_id" {
  value = module.hub_vnet.vnet_id
}

output "hub_subnets" {
  value = module.hub_vnet.subnet_ids
}

# =============================================================================
# Spokes
# =============================================================================

output "spoke_vnet_ids" {
  description = "IDs of the Spokes VNets deployed"
  value = {
    for k, v in module.spokes : k => v.vnet_id
  }
}

output "spoke_subnets_summary" {
  description = "Summary of the subnets for each Spoke"
  value = {
    for k, v in module.spokes : k => v.subnet_ids
  }
}

# =============================================================================
# Bastion
# =============================================================================

output "bastion_host_name" {
  description = "Name of the Bastion resource for connection"
  value       = module.bastion.dns_name
}

output "bastion_public_ip" {
  description = "Public IP of the Bastion (secure entry)"
  value       = module.bastion.public_ip_address
}

# =============================================================================
# VM List
# =============================================================================

output "vm_inventory_ips" {
  description = "Inventory of VMs and their private IPs"
  value = {
    for k, v in module.vms : k => {
      private_ip = v.private_ip
      subnet_id  = v.subnet_id
    }
  }
}

output "vm_private_key" {
  value     = tls_private_key.ssh_key.private_key_pem
  sensitive = true
  # Use terraform output -raw vm_private_key > lab04-key.pem to save the private key locally
  # Use chmod 400 lab04-key.pem to set the correct permissions  
}
