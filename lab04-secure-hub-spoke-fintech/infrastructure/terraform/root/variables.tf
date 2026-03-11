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

# ---- Hub Virtual Network ----
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

# ---- DEV Spoke Virtual Network ----
variable "spoke_dev_vnet_name" {
  description = "Name for the Spoke VNet for Dev environment"
  type        = string
}

variable "spoke_dev_address_space" {
  description = "Address space for the Spoke VNet for Dev environment (e.g. ['10.1.0.0/16'])"
  type        = list(string)
}

variable "spoke_dev_subnets" {
  type        = map(string)
  description = "Map of subnets for the Spoke VNet for Dev environment"
}

# ---- PROD Spoke Virtual Network ----
variable "spoke_prod_vnet_name" {
  description = "Name for the Spoke VNet for Prod environment"
  type        = string
}

variable "spoke_prod_address_space" {
  description = "Address space for the Spoke VNet for Prod environment (e.g. ['10.1.0.0/16'])"
  type        = list(string)
}

variable "spoke_prod_subnets" {
  type        = map(string)
  description = "Map of subnets for the Spoke VNet for Dev environment"
}

# ---- Hub VNet Firewall Private IP ----  
variable "hub_firewall_private_ip" {
  description = "Private IP address for the Hub VNet Firewall"
  type        = string
}

# ---- Tags ----
locals {
  tags = merge(var.tags_common, var.tags_extra)
}
