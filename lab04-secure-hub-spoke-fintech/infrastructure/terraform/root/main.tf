# =============================================================================
# MAIN - Core infrastructure resources
# =============================================================================

# =============================================================================
# Resource Groups
# =============================================================================

# --- Hub Resource Group ---
module "rg_hub" {
  source   = "git::https://github.com/pedrozea/azure-terraform-modules.git//modules/resource_group?ref=v0.6.0"
  name     = "rg-hub-${var.resource_suffix}"
  location = var.location
  tags     = local.tags
}

# --- Workloads Resource Group ---
module "rg_workloads" {
  source   = "git::https://github.com/pedrozea/azure-terraform-modules.git//modules/resource_group?ref=v0.6.0"
  for_each = local.environments

  name     = "rg-${each.key}-${var.resource_suffix}"
  location = var.location
  tags     = local.tags
}

# =============================================================================
# Hub VNet
# =============================================================================

module "hub_vnet" {
  source = "git::https://github.com/pedrozea/azure-terraform-modules.git//modules/hub_vnet?ref=v0.6.0"

  name                = var.hub_vnet_name
  resource_group_name = module.rg_hub.name
  location            = module.rg_hub.location
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
  source = "git::https://github.com/pedrozea/azure-terraform-modules.git//modules/azure_bastion?ref=v0.6.0"

  name                = "bas-shared-hub-${var.resource_suffix}"
  resource_group_name = module.rg_hub.name
  location            = module.rg_hub.location
  subnet_id           = module.hub_vnet.subnet_ids["AzureBastionSubnet"] # Extract the ID of the "AzureBastionSubnet" subnet from the Hub
  tags                = local.tags
}

# =============================================================================
# Azure Firewall
# =============================================================================

module "firewall" {
  source = "git::https://github.com/pedrozea/azure-terraform-modules.git//modules/azure_firewall?ref=v0.6.0"

  name                = "fw-shared-hub-${var.resource_suffix}"
  resource_group_name = module.rg_hub.name
  location            = var.location
  subnet_id           = module.hub_vnet.subnet_ids["AzureFirewallSubnet"]

  # Network rules
  network_rules = var.hub_firewall_network_rules

  tags = local.tags
}

# =============================================================================
# Spoke VNets
# =============================================================================

module "spokes" {
  source   = "git::https://github.com/pedrozea/azure-terraform-modules.git//modules/spoke_vnet?ref=v0.6.0"
  for_each = local.spoke_inventory

  name          = each.value.name
  address_space = each.value.space
  subnets       = each.value.subnets

  resource_group_name = module.rg_workloads[each.key].name
  location            = var.location

  # Hub VNet Connection
  hub_vnet_id             = module.hub_vnet.vnet_id
  hub_vnet_name           = module.hub_vnet.vnet_name
  hub_resource_group_name = module.rg_hub.name
  hub_firewall_private_ip = module.firewall.private_ip

  tags = local.tags
}

# =============================================================================
# SSH Key
# =============================================================================

# Generate SSH key pair dynamically
resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Save private key locally in tfstate to use with Bastion
resource "local_file" "private_key" {
  content         = tls_private_key.ssh_key.private_key_pem
  filename        = "${path.module}/keys/lab04-ssh-key.pem"
  file_permission = "0600"
}

# =============================================================================
# Workloads (VMs)
# =============================================================================

module "vms" {
  source   = "git::https://github.com/pedrozea/azure-terraform-modules.git//modules/linux_vm?ref=v0.6.0"
  for_each = local.vm_inventory

  name      = each.key
  subnet_id = each.value.subnet_id
  vm_size   = each.value.vm_size

  resource_group_name = module.rg_workloads[each.value.environment].name
  location            = var.location
  public_key          = tls_private_key.ssh_key.public_key_openssh
  admin_username      = "adminuser"
}
