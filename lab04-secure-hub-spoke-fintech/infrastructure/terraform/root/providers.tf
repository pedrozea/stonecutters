# =============================================================================
# PROVIDERS - Versions and configuration
# =============================================================================

terraform {
  required_version = ">= 1.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
    hostinger = {
      source  = "hostinger/hostinger"
      version = "0.1.22"
    }
  }
}

provider "azurerm" {
  features {}
}

# Hostinger: token via HOSTINGER_API_TOKEN env var (e.g. in CI)
provider "hostinger" {}
