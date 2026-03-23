# ===========================================================================
# Locals
# ===========================================================================

locals {
  # ===========================================================================
  # Tags
  # ===========================================================================

  tags = merge(var.tags_common, var.tags_extra)

  # ===========================================================================
  # Environments
  # ===========================================================================

  environments = toset([
    "app1-dev",
    "app1-prod",
    "app2-dev",
    "app2-prod"
  ])

  # ===========================================================================
  # Networking - Spokes Inventory
  # ===========================================================================

  spoke_inventory = {
    "app1-dev" = {
      name    = var.spoke_app1_dev_vnet_name,
      space   = var.spoke_app1_dev_address_space,
      subnets = var.spoke_app1_dev_subnets
    }
    "app1-prod" = {
      name    = var.spoke_app1_prod_vnet_name,
      space   = var.spoke_app1_prod_address_space,
      subnets = var.spoke_app1_prod_subnets
    }
    "app2-dev" = {
      name    = var.spoke_app2_dev_vnet_name,
      space   = var.spoke_app2_dev_address_space,
      subnets = var.spoke_app2_dev_subnets
    }
    "app2-prod" = {
      name    = var.spoke_app2_prod_vnet_name,
      space   = var.spoke_app2_prod_address_space,
      subnets = var.spoke_app2_prod_subnets
    }
  }

  # ===========================================================================
  # Virtual Machines Inventory
  # ===========================================================================

  vm_inventory = {
    # ============== APP 1 - Dev ===============
    "vm-app1-dev-web" = {
      subnet_id   = module.spokes["app1-dev"].subnet_ids["snet-app"]
      vm_size     = var.vm_size_app1_dev_web
      environment = "app1-dev"
    }

    "vm-app1-dev-db" = {
      subnet_id   = module.spokes["app1-dev"].subnet_ids["snet-db"]
      vm_size     = var.vm_size_app1_dev_db
      environment = "app1-dev"
    }

    # ============== APP 1 - Prod ===============
    "vm-app1-prod-web" = {
      subnet_id   = module.spokes["app1-prod"].subnet_ids["snet-app"]
      vm_size     = var.vm_size_app1_prod_web
      environment = "app1-prod"
    }

    "vm-app1-prod-db" = {
      subnet_id   = module.spokes["app1-prod"].subnet_ids["snet-db"]
      vm_size     = var.vm_size_app1_prod_db
      environment = "app1-prod"
    }

    # ============== APP 2 - Dev ===============
    "vm-app2-dev-web" = {
      subnet_id   = module.spokes["app2-dev"].subnet_ids["snet-app"]
      vm_size     = var.vm_size_app2_dev_web
      environment = "app2-dev"
    }

    "vm-app2-dev-db" = {
      subnet_id   = module.spokes["app2-dev"].subnet_ids["snet-db"]
      vm_size     = var.vm_size_app2_dev_db
      environment = "app2-dev"
    }

    # ============== APP 2 - Prod ===============
    "vm-app2-prod-web" = {
      subnet_id   = module.spokes["app2-prod"].subnet_ids["snet-app"]
      vm_size     = var.vm_size_app2_prod_web
      environment = "app2-prod"
    }
    "vm-app2-prod-db" = {
      subnet_id   = module.spokes["app2-prod"].subnet_ids["snet-db"]
      vm_size     = var.vm_size_app2_prod_db
      environment = "app2-prod"
    }
  }

  # ===========================================================================
  # Network Security Groups (NSGs)
  # ===========================================================================

  # ================== Azure Bastion NSG Rules ==================
  bastion_nsg_rules = [
    {
      name                       = "AllowHttpsInbound"
      priority                   = 120
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "443"
      source_address_prefix      = "Internet"
      destination_address_prefix = "*"
    },
    {
      name                       = "AllowGatewayManagerInbound"
      priority                   = 130
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "443"
      source_address_prefix      = "GatewayManager"
      destination_address_prefix = "*"
    },
    {
      name                       = "AllowSshRdpOutbound"
      priority                   = 100
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "*"
      destination_address_prefix = "VirtualNetwork"
    },
    {
      name                       = "AllowAzureCloudOutbound"
      priority                   = 110
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "443"
      source_address_prefix      = "*"
      destination_address_prefix = "AzureCloud"
    }
  ]

}
