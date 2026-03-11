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
  firewall_subnet_prefix = var.firewall_subnet_prefix
  bastion_subnet_prefix  = var.bastion_subnet_prefix
  gateway_subnet_prefix  = var.gateway_subnet_prefix

  tags = local.tags
}

module "spoke_dev" {
  source = "git::https://github.com/pedrozea/azure-terraform-modules.git//modules/spoke_vnet?ref=v0.4.0"

  name                = "spoke-vnet-${var.resource_suffix}"
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  address_space       = var.spoke_address_space
  subnets             = var.spoke_subnets

  # Connection to Hub VNet
  hub_vnet_id             = module.hub_vnet.vnet_id
  hub_vnet_name           = module.hub_vnet.vnet_name
  hub_resource_group_name = module.resource_group.name

  # Temporary IP for Firewall
  hub_firewall_private_ip = var.hub_firewall_private_ip

  tags = local.tags
}
