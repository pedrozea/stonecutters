# ===========================================================================
# Locals
# ===========================================================================

locals {
  # ===========================================================================
  # Tags
  # ===========================================================================

  tags = merge(var.tags_common, var.tags_extra)

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
      subnet_id = module.spokes["app1-dev"].subnet_ids["snet-app"]
      size      = var.vm_size_app1_dev_web
    }

    "vm-app1-dev-db" = {
      subnet_id = module.spokes["app1-dev"].subnet_ids["snet-db"]
      size      = var.vm_size_app1_dev_db
    }

    # ============== APP 1 - Prod ===============
    "vm-app1-prod-web" = {
      subnet_id = module.spokes["app1-prod"].subnet_ids["snet-app"]
      size      = var.vm_size_app1_prod_web
    }

    "vm-app1-prod-db" = {
      subnet_id = module.spokes["app1-prod"].subnet_ids["snet-db"]
      size      = var.vm_size_app1_prod_db
    }

    # ============== APP 2 - Dev ===============
    "vm-app2-dev-web" = {
      subnet_id = module.spokes["app2-dev"].subnet_ids["snet-app"]
      vm_size   = var.vm_size_app2_dev_web
    }

    "vm-app2-dev-db" = {
      subnet_id = module.spokes["app2-dev"].subnet_ids["snet-db"]
      vm_size   = var.vm_size_app2_dev_db
    }

    # ============== APP 2 - Prod ===============
    "vm-app2-prod-web" = {
      subnet_id = module.spokes["app2-prod"].subnet_ids["snet-app"]
      vm_size   = var.vm_size_app2_prod_web
    }
    "vm-app2-prod-db" = {
      subnet_id = module.spokes["app2-prod"].subnet_ids["snet-db"]
      vm_size   = var.vm_size_app2_prod_db
    }
  }
}
