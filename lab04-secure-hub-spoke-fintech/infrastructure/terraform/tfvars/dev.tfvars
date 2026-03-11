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
hub_address_space = ["10.1.0.0/16"]

firewall_subnet_prefix = "10.1.1.0/26"
bastion_subnet_prefix  = "10.1.2.0/26"
gateway_subnet_prefix  = "10.1.3.0/27"

# ---- Spoke VNet ----
spoke_address_space = ["10.100.0.0/22"]
spoke_subnets = {
  "snet-app-dev" = "10.100.1.0/24"
  "snet-db-dev"  = "10.100.2.0/24"
}

hub_firewall_private_ip = "10.1.1.4"
