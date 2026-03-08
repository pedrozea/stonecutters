# =============================================================================
# PROD - Production environment
# =============================================================================

# ---- Resource Group ----
resource_suffix = "pz-lab04-prod"
location        = "westeurope"

tags_extra = {
  env = "Prod"
}

# ---- Hub VNet ----
hub_address_space = ["10.20.0.0/16"]

firewall_subnet_prefix = "10.20.1.0/26"
bastion_subnet_prefix  = "10.20.2.0/26"
gateway_subnet_prefix  = "10.20.3.0/27"

