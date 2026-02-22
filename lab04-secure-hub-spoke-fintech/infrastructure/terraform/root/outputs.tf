# =============================================================================
# OUTPUTS - Values exposed for other modules or CI
# =============================================================================

output "resource_group_name" {
  description = "Name of the created resource group"
  value       = azurerm_resource_group.rg.name
}

output "virtual_network_id" {
  description = "ID of the virtual network"
  value       = module.virtual_network.vnet.id
}

output "virtual_network_name" {
  description = "Name of the virtual network"
  value       = module.virtual_network.vnet.name
}

output "virtual_network_subnet_ids" {
  description = "Map of subnet names to IDs in the virtual network"
  value       = module.virtual_network.vnet.subnet_ids
}
