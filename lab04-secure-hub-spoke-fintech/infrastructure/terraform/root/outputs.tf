# =============================================================================
# OUTPUTS - Values exposed for other modules or CI
# =============================================================================

output "resource_group_name" {
  description = "Name of the created resource group"
  value       = azurerm_resource_group.rg.name
}
