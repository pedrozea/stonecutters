# =============================================================================
# Global Variables
# =============================================================================
resource_suffix = "pz-lab04"
location        = "westeurope"

tags_extra = {
  pipeline = "GitHub Actions"
}

# =============================================================================
# Hub VNet - Security and Central Connectivity
# =============================================================================
hub_vnet_name     = "hub-vnet-shared"
hub_address_space = ["10.1.0.0/16"]

firewall_subnet_prefix  = "10.1.1.0/26"
bastion_subnet_prefix   = "10.1.2.0/26"
gateway_subnet_prefix   = "10.1.3.0/27"
hub_firewall_private_ip = "10.1.1.4"

# =============================================================================
# APP 1 - Spokes (Dev & Prod)
# =============================================================================

# ---- APP 1 (Dev) ----
spoke_app1_dev_vnet_name     = "spoke-app1-dev"
spoke_app1_dev_address_space = ["10.100.1.0/24"]
spoke_app1_dev_subnets = {
  "snet-app" = "10.100.1.0/27"
  "snet-db"  = "10.100.1.32/27"
}

# ---- APP 1 (Prod) ----
spoke_app1_prod_vnet_name     = "spoke-app1-prod"
spoke_app1_prod_address_space = ["10.200.1.0/24"]
spoke_app1_prod_subnets = {
  "snet-app" = "10.200.1.0/27"
  "snet-db"  = "10.200.1.32/27"
}

# =============================================================================
# APP 2 - Spokes (Dev & Prod)
# =============================================================================

# ---- APP 2 (Prod) ----
spoke_app2_prod_vnet_name     = "spoke-app2-prod"
spoke_app2_prod_address_space = ["10.200.2.0/24"]
spoke_app2_prod_subnets = {
  "snet-app" = "10.200.2.0/27"
  "snet-db"  = "10.200.2.32/27"
}

# ---- APP 2 (Dev) ----
spoke_app2_dev_vnet_name     = "spoke-app2-dev"
spoke_app2_dev_address_space = ["10.100.2.0/24"]
spoke_app2_dev_subnets = {
  "snet-app" = "10.100.2.0/27"
  "snet-db"  = "10.100.2.32/27"
}

# =============================================================================
# Workload: APP 1 - Dev
# =============================================================================

# ---- APP 1 (Web Server) ----
vm_name_app1_dev_web           = "vm-app1-dev-web"
vm_admin_username_app1_dev_web = "adminuser"
vm_size_app1_dev_web           = "Standard_B1s"

# ---- APP 1 (Database Server) ----
vm_name_app1_dev_db           = "vm-app1-dev-db"
vm_admin_username_app1_dev_db = "adminuser"
vm_size_app1_dev_db           = "Standard_B1s"

# =============================================================================
# Workload: APP 1 - Prod
# =============================================================================

# ---- APP 1 (Web Server) ----
vm_name_app1_prod_web           = "vm-app1-prod-web"
vm_admin_username_app1_prod_web = "adminuser"
vm_size_app1_prod_web           = "Standard_B1s"

# ---- APP 1 (Database Server) ----
vm_name_app1_prod_db           = "vm-app1-prod-db"
vm_admin_username_app1_prod_db = "adminuser"
vm_size_app1_prod_db           = "Standard_B1s"

# =============================================================================
# Workload: APP 2 - Dev
# =============================================================================

# ---- APP 2 (Web Server) ----
vm_name_app2_dev_web           = "vm-app2-dev-web"
vm_admin_username_app2_dev_web = "adminuser"
vm_size_app2_dev_web           = "Standard_B1s"

# ---- APP 2 (Database Server) ----
vm_name_app2_dev_db           = "vm-app2-dev-db"
vm_admin_username_app2_dev_db = "adminuser"
vm_size_app2_dev_db           = "Standard_B1s"

# =============================================================================
# Workload: APP 2 - Prod
# =============================================================================

# ---- APP 2 (Web Server) ----
vm_name_app2_prod_web           = "vm-app2-prod-web"
vm_admin_username_app2_prod_web = "adminuser"
vm_size_app2_prod_web           = "Standard_B1s"

# ---- APP 2 (Database Server) ----
vm_name_app2_prod_db           = "vm-app2-prod-db"
vm_admin_username_app2_prod_db = "adminuser"
vm_size_app2_prod_db           = "Standard_B1s"
