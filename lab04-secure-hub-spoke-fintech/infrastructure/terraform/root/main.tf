# =============================================================================
# MAIN - Core infrastructure resources
# =============================================================================

# =============================================================================
# Resource Group
# =============================================================================

module "resource_group" {
  source = "git::https://github.com/pedrozea/azure-terraform-modules.git//modules/resource_group?ref=v0.5.0"

  name     = "rg-${var.resource_suffix}"
  location = var.location
  tags     = local.tags
}

# =============================================================================
# Hub VNet
# =============================================================================

module "hub_vnet" {
  source = "git::https://github.com/pedrozea/azure-terraform-modules.git//modules/hub_vnet?ref=v0.5.0"

  name                = var.hub_vnet_name
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  address_space       = var.hub_address_space

  # ---- Subnets ----
  firewall_subnet_prefix = var.firewall_subnet_prefix
  bastion_subnet_prefix  = var.bastion_subnet_prefix
  gateway_subnet_prefix  = var.gateway_subnet_prefix

  tags = local.tags
}

# =============================================================================
# Azure Bastion
# =============================================================================

module "bastion" {
  source = "git::https://github.com/pedrozea/azure-terraform-modules.git//modules/azure_bastion?ref=v0.5.0"

  name                = "bas-shared-hub-${var.resource_suffix}"
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  subnet_id           = module.hub_vnet.subnet_ids["AzureBastionSubnet"] # Extract the ID of the "AzureBastionSubnet" subnet from the Hub
  tags                = local.tags
}

# =============================================================================
# SSH Key
# =============================================================================

# Generate SSH key pair dynamically
resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Save private key locally to use with Bastion
resource "local_file" "private_key" {
  content         = tls_private_key.ssh_key.private_key_pem
  filename        = "${path.module}/keys/lab04-ssh-key.pem"
  file_permission = "0600"
}

# =============================================================================
# Spoke VNets
# =============================================================================

module "spokes" {
  source   = "git::https://github.com/pedrozea/azure-terraform-modules.git//modules/spoke_vnet?ref=v0.5.0"
  for_each = local.spoke_inventory

  name          = each.value.name
  address_space = each.value.space
  subnets       = each.value.subnets

  resource_group_name = module.resource_group.name
  location            = module.resource_group.location

  # Hub VNet Connection
  hub_vnet_id             = module.hub_vnet.vnet_id
  hub_vnet_name           = module.hub_vnet.vnet_name
  hub_resource_group_name = module.resource_group.name
  hub_firewall_private_ip = var.hub_firewall_private_ip

  tags = local.tags
}

# =============================================================================
# Workloads (VMs)
# =============================================================================

module "vms" {
  source   = "git::https://github.com/pedrozea/azure-terraform-modules.git//modules/linux_vm?ref=v0.5.0"
  for_each = local.vm_inventory

  name      = each.key
  subnet_id = each.value.subnet_id
  vm_size   = each.value.vm_size

  resource_group_name = module.resource_group.name
  location            = var.location
  public_key          = tls_private_key.ssh_key.public_key_openssh
  admin_username      = "adminuser"
}

