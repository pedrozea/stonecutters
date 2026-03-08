# =============================================================================
# DEV - Development environment
# =============================================================================

# ---- Resource Group ----
resource_suffix = "pz-lab04-dev"
location        = "westeurope"

tags_extra = {
  env = "Dev"
}

# ---- Hub VNet ----
hub_address_space = ["10.10.0.0/16"]

firewall_subnet_prefix = "10.10.1.0/26"
bastion_subnet_prefix  = "10.10.2.0/26"
gateway_subnet_prefix  = "10.10.3.0/27"
