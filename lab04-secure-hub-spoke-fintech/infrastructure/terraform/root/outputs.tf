# =============================================================================
# OUTPUTS - Values exposed for other modules or CI
# =============================================================================

output "resource_group_name" {
  description = "Name of the created resource group"
  value       = azurerm_resource_group.rg.name
}

output "vnet_hub_id" {
  description = "ID of the Hub virtual network"
  value       = module.vnet_hub.id
}

output "vnet_hub_name" {
  description = "Name of the Hub virtual network"
  value       = module.vnet_hub.name
}

output "vnet_hub_subnet_ids" {
  description = "Map of subnet names to IDs in the Hub VNet"
  value       = module.vnet_hub.subnet_ids
}
