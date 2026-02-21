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
    course = "AZ-104"
    owner  = "Pedro Zea"
    source = "Terraform"
  }
}

variable "tags_extra" {
  description = "Environment-specific tags (merged with tags_common)"
  type        = map(string)
  default     = {}
}

# ---- Virtual Network (Hub) ----
variable "vnet_address_space" {
  description = "Address space for the Hub VNet (e.g. ['10.0.0.0/16'])"
  type        = list(string)
}

variable "vnet_dns_servers" {
  description = "Custom DNS servers for the VNet"
  type        = list(string)
  default     = []
}

variable "vnet_subnets" {
  description = "Map of subnets for the Hub VNet. Each subnet: address_prefix, optional delegation_name/delegation_service"
  type = map(object({
    address_prefix     = string
    delegation_name    = optional(string)
    delegation_service = optional(string, "Microsoft.Network/networkInterfaces")
    delegation_actions = optional(list(string), ["Microsoft.Network/networkInterfaces/*"])
  }))
  default = {}
}

locals {
  tags = merge(var.tags_common, var.tags_extra)
}
