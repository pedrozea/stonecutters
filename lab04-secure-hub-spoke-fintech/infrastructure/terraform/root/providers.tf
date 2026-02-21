terraform {
  required_version = ">= 1.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.52.0"
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

provider "hostinger" {

}
