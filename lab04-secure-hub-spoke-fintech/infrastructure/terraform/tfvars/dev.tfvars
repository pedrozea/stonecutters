# =============================================================================
# DEV - Development environment
# =============================================================================

# ---- Resource Group ----
resource_suffix = "az104-lab04-dev-weu"
location        = "westeurope"

tags_extra = {
  env = "Dev"
}

# ---- VNet ----
vnet_address_space = ["10.0.0.0/16"]
vnet_subnets = {
  "AzureFirewallSubnet" = "10.0.1.0/26"
  "AzureBastionSubnet"  = "10.0.2.0/26"
}
