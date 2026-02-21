# =============================================================================
# MAIN - Core infrastructure resources
# =============================================================================
# Baseline: Resource Group. Expand with Hub-Spoke, Firewall, Bastion, etc.

# ---- Resource Group ----
resource "azurerm_resource_group" "rg" {
  name     = "rg-${var.resource_suffix}"
  location = var.location
  tags     = local.tags
}
