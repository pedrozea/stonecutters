# =============================================================================
# PROD - Production environment
# =============================================================================

# ---- Resource Group ----
resource_suffix = "az104-lab04-prod-weu"
location        = "westeurope"

tags_extra = {
  env = "Prod"
}

# ---- Hub VNet ----
vnet_address_space = ["10.0.0.0/16"]
vnet_subnets = {
  "AzureFirewallSubnet" = {
    address_prefix = "10.0.1.0/26"
  }
  "AzureBastionSubnet" = {
    address_prefix     = "10.0.2.0/26"
    delegation_name    = "Microsoft.Network.bastionHosts"
    delegation_service = "Microsoft.Network/bastionHosts"
    delegation_actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
  }
}
