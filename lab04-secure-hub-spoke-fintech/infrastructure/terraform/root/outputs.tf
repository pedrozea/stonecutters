# =============================================================================
# OUTPUTS - Values exposed for other modules or CI
# =============================================================================

# ---- Resource Group ----
output "resource_group_name" {
  description = "Name of the created resource group"
  value       = module.resource_group.name
}

# ---- Hub VNet ----
output "hub_vnet_id" {
  value = module.hub_vnet.vnet_id
}

output "hub_subnets" {
  value = module.hub_vnet.subnet_ids
}

# ---- DEV Spoke VNet ----
output "spoke_dev_vnet_id" {
  value = module.spoke_dev.vnet_id
}

output "spoke_dev_subnets" {
  value = module.spoke_dev.subnet_ids
}

# ---- PROD Spoke VNet ----
output "spoke_prod_vnet_id" {
  value = module.spoke_prod.vnet_id
}

output "spoke_prod_subnets" {
  value = module.spoke_prod.subnet_ids
}
