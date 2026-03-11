# =============================================================================
# DEV - Development environment
# =============================================================================

# ---- Resource Group ----
resource_suffix = "pz-lab04"
location        = "westeurope"

tags_extra = {
  pipeline = "GitHub Actions"
}

# ---- Hub VNet ----
hub_vnet_name     = "hub-vnet-shared"
hub_address_space = ["10.1.0.0/16"]

firewall_subnet_prefix = "10.1.1.0/26"
bastion_subnet_prefix  = "10.1.2.0/26"
gateway_subnet_prefix  = "10.1.3.0/27"

# ---- DEV Spoke VNet ----
spoke_dev_vnet_name     = "spoke-vnet-dev"
spoke_dev_address_space = ["10.100.0.0/24"]
spoke_dev_subnets = {
  "snet-app-dev" = "10.100.0.0/27"
  "snet-db-dev"  = "10.100.0.32/27"
}

# ---- PROD Spoke VNet ----
spoke_prod_vnet_name     = "spoke-vnet-prod"
spoke_prod_address_space = ["10.200.0.0/24"]
spoke_prod_subnets = {
  "snet-app-prod" = "10.200.0.0/27"
  "snet-db-prod"  = "10.200.0.32/27"
}

# ---- Hub VNet Firewall Private IP ----
hub_firewall_private_ip = "10.1.1.4"


