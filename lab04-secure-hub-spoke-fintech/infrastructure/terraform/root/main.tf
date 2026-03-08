# =============================================================================
# MAIN - Core infrastructure resources
# =============================================================================
# Baseline: Resource Group + Hub VNet. Expand with Spokes, Firewall, Bastion.

# ---- Resource Group ----
module "resource_group" {
  source = "git::https://github.com/pedrozea/azure-terraform-modules.git//modules/resource_group?ref=v0.3.0"

  name     = "rg-${var.resource_suffix}"
  location = var.location
  tags     = local.tags
}

# ---- Virtual Network (Hub) - remote module ----
module "hub_vnet" {
  source = "git::https://github.com/pedrozea/azure-terraform-modules.git//modules/hub_vnet?ref=v0.3.0"

  name                = "hub-vnet-${var.resource_suffix}"
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  address_space       = var.hub_address_space

  # ---- Subnets ----
  firewall_subnet_prefix = var.hub_firewall_subnet_prefix
  bastion_subnet_prefix  = var.hub_bastion_subnet_prefix
  gateway_subnet_prefix  = var.hub_gateway_subnet_prefix

  tags = local.tags
}
