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
hub_address_space = ["10.5.0.0/16"]

firewall_subnet_prefix = "10.5.1.0/26"
bastion_subnet_prefix  = "10.5.2.0/26"
gateway_subnet_prefix  = "10.5.3.0/27"

# ---- Spoke VNet ----
spoke_address_space = ["10.200.0.0/22"]
spoke_subnets = {
  "snet-app-prod" = "10.200.1.0/24"
  "snet-db-prod"  = "10.200.2.0/24"
}

hub_firewall_private_ip = "10.5.1.4"
