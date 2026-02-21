# =============================================================================
# MAIN - Core infrastructure resources
# =============================================================================
# Baseline: Resource Group + Hub VNet. Expand with Spokes, Firewall, Bastion.

# ---- Resource Group ----
resource "azurerm_resource_group" "rg" {
  name     = "rg-${var.resource_suffix}"
  location = var.location
  tags     = local.tags
}

# ---- Virtual Network (Hub) - remote module ----
module "vnet_hub" {
  source = "git::https://github.com/pedrozea/azure-terraform-modules.git//modules/virtual-network?ref=v0.1.0"

  name                = "vnet-${var.resource_suffix}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  address_space       = var.vnet_address_space
  dns_servers         = var.vnet_dns_servers
  subnets             = var.vnet_subnets
  tags                = local.tags
}

