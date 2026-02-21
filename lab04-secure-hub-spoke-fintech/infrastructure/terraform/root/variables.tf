# ========== GENERAL ==========
variable "resource_suffix" {
  description = "Suffix for resource names"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "tags_common" {
  description = "Common tags for all environments"
  type        = map(string)
  default = {
    course = "AZ-104"
    owner  = "Pedro Zea"
    source = "Terraform"
  }
}

variable "tags_extra" {
  description = "Environment-specific tags"
  type        = map(string)
  default     = {}
}

locals {
  tags = merge(var.tags_common, var.tags_extra)
}
