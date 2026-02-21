# ----------------------------------------------------
# BASELINE
# ----------------------------------------------------

# ---- Resource Group ----
resource "azurerm_resource_group" "rg" {
  name     = "rg-${var.resource_suffix}"
  location = var.location
  tags     = local.tags
}
