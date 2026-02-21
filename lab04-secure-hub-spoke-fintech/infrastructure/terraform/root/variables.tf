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

locals {
  tags = merge(var.tags_common, var.tags_extra)
}
