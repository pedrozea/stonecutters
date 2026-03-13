# =============================================================================
# VARIABLES - Inputs and derived locals
# =============================================================================

# ---- Core inputs (from tfvars) ----
variable "resource_suffix" {
  description = "Suffix for resource names (e.g. az104-lab04-dev-weu)"
  type        = string
}

variable "location" {
  description = "Azure region (e.g. westeurope)"
  type        = string
}

# ---- Tagging ----
variable "tags_common" {
  description = "Tags applied to all resources"
  type        = map(string)
  default = {
    lab    = "Lab04"
    owner  = "Pedro Zea"
    source = "Terraform"
  }
}

variable "tags_extra" {
  description = "Environment-specific tags (merged with tags_common)"
  type        = map(string)
  default     = {}
}

#==============================================================================
# Hub Virtual Network
# =============================================================================

variable "hub_vnet_name" {
  description = "Name for the Hub VNet"
  type        = string
}

variable "hub_address_space" {
  description = "Address space for the Hub VNet (e.g. ['10.0.0.0/16'])"
  type        = list(string)
}

variable "firewall_subnet_prefix" {
  description = "Prefix for the Hub VNet Firewall subnet"
  type        = string
}

variable "bastion_subnet_prefix" {
  description = "Prefix for the Hub VNet Bastion subnet"
  type        = string
}

variable "gateway_subnet_prefix" {
  description = "Prefix for the Hub VNet Gateway subnet"
  type        = string
}

# ---- Hub VNet Firewall Private IP ----  
variable "hub_firewall_private_ip" {
  description = "Private IP address for the Hub VNet Firewall"
  type        = string
}

# =============================================================================
# APP 1 - Spokes (Dev & Prod)
# =============================================================================

# ---- APP 1 (Dev) ----
variable "spoke_app1_dev_vnet_name" {
  description = "Name for the Spoke VNet for App1 Dev environment"
  type        = string
}

variable "spoke_app1_dev_address_space" {
  description = "Address space for the Spoke VNet for App1 Dev environment (e.g. ['10.1.0.0/16'])"
  type        = list(string)
}

variable "spoke_app1_dev_subnets" {
  type        = map(string)
  description = "Map of subnets for the Spoke VNet for App1 Dev environment"
}

# ---- APP 1 (Prod) ----
variable "spoke_app1_prod_vnet_name" {
  description = "Name for the Spoke VNet for App1 Prod environment"
  type        = string
}

variable "spoke_app1_prod_address_space" {
  description = "Address space for the Spoke VNet for App1 Prod environment (e.g. ['10.1.0.0/16'])"
  type        = list(string)
}

variable "spoke_app1_prod_subnets" {
  type        = map(string)
  description = "Map of subnets for the Spoke VNet for App1 Prod environment"
}

# ===========================================================================
# APP 2 - Spokes (Dev & Prod)
# =============================================================================

# ---- APP 2 (Dev) ----
variable "spoke_app2_dev_vnet_name" {
  description = "Name for the Spoke VNet for App2 Dev environment"
  type        = string
}

variable "spoke_app2_dev_address_space" {
  description = "Address space for the Spoke VNet for App2 Dev environment (e.g. ['10.1.0.0/16'])"
  type        = list(string)
}

variable "spoke_app2_dev_subnets" {
  type        = map(string)
  description = "Map of subnets for the Spoke VNet for App2 Dev environment"
}

# ---- APP 2 (Prod) ----
variable "spoke_app2_prod_vnet_name" {
  description = "Name for the Spoke VNet for App2 Prod environment"
  type        = string
}

variable "spoke_app2_prod_address_space" {
  description = "Address space for the Spoke VNet for App2 Prod environment (e.g. ['10.1.0.0/16'])"
  type        = list(string)
}

variable "spoke_app2_prod_subnets" {
  type        = map(string)
  description = "Map of subnets for the Spoke VNet for App2 Prod environment"
}

# ===========================================================================
# Workload: APP 1 - Dev
# =============================================================================

# ---- APP 1 (Web Server) ----
variable "vm_name_app1_dev_web" {
  description = "Name for the VM for App1 Dev environment"
  type        = string
}

variable "vm_admin_username_app1_dev_web" {
  description = "Admin username for the VM for App1 Dev environment"
  type        = string
}

variable "vm_size_app1_dev_web" {
  description = "VM size for the Web Server for App1 Dev environment"
  type        = string
}

# ---- APP 1 (Database Server) ----
variable "vm_name_app1_dev_db" {
  description = "Name for the VM for App1 Dev environment"
  type        = string
}

variable "vm_admin_username_app1_dev_db" {
  description = "Admin username for the VM for App1 Dev environment"
  type        = string
}

variable "vm_size_app1_dev_db" {
  description = "VM size for the Database Server for App1 Dev environment"
  type        = string
}

# ===========================================================================
# Workload: APP 1 - Prod
# =============================================================================

# ---- APP 1 (Web Server) ----
variable "vm_name_app1_prod_web" {
  description = "Name for the VM for App1 Prod environment"
  type        = string
}

variable "vm_admin_username_app1_prod_web" {
  description = "Admin username for the VM for App1 Prod environment"
  type        = string
}

variable "vm_size_app1_prod_web" {
  description = "VM size for the Web Server for App1 Dev environment"
  type        = string
}

# ---- APP 1 (Database Server) ----
variable "vm_name_app1_prod_db" {
  description = "Name for the VM for App1 Prod environment"
  type        = string
}

variable "vm_admin_username_app1_prod_db" {
  description = "Admin username for the VM for App1 Prod environment"
  type        = string
}

variable "vm_size_app1_prod_db" {
  description = "VM size for the Database Server for App1 Prod environment"
  type        = string
}

# ===========================================================================

# ===========================================================================
# Workload: APP 2 - Dev
# =============================================================================

# ---- APP 2 (Web Server) ----
variable "vm_name_app2_dev_web" {
  description = "Name for the VM for App2 Dev environment"
  type        = string
}

variable "vm_admin_username_app2_dev_web" {
  description = "Admin username for the VM for App2 Dev environment"
  type        = string
}

variable "vm_size_app2_dev_web" {
  description = "VM size for the Web Server for App2 Dev environment"
  type        = string
}

# ---- APP 2 (Database Server) ----
variable "vm_name_app2_dev_db" {
  description = "Name for the VM for App2 Dev environment"
  type        = string
}

variable "vm_admin_username_app2_dev_db" {
  description = "Admin username for the VM for App2 Dev environment"
  type        = string
}

variable "vm_size_app2_dev_db" {
  description = "VM size for the Database Server for App2 Dev environment"
  type        = string
}

# ===========================================================================
# Workload: APP 2 - Prod
# =============================================================================

# ---- APP 2 (Web Server) ----
variable "vm_name_app2_prod_web" {
  description = "Name for the VM for App2 Prod environment"
  type        = string
}

variable "vm_admin_username_app2_prod_web" {
  description = "Admin username for the VM for App2 Prod environment"
  type        = string
}

variable "vm_size_app2_prod_web" {
  description = "VM size for the Web Server for App2 Dev environment"
  type        = string
}

# ---- APP 2 (Database Server) ----
variable "vm_name_app2_prod_db" {
  description = "Name for the VM for App2 Prod environment"
  type        = string
}

variable "vm_admin_username_app2_prod_db" {
  description = "Admin username for the VM for App2 Prod environment"
  type        = string
}

variable "vm_size_app2_prod_db" {
  description = "VM size for the Database Server for App2 Prod environment"
  type        = string
}
