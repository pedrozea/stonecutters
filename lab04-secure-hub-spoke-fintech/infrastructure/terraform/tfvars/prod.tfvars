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
vnet_address_space = ["10.1.0.0/16"]
vnet_subnets = {
  "AzureFirewallSubnet" = "10.1.1.0/26"
  "AzureBastionSubnet"  = "10.1.2.0/26"
}
