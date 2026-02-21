# =============================================================================
# PROD - Production environment
# =============================================================================

# ---- Resource Group ----
resource_suffix = "az104-lab04-prod-weu"
location        = "westeurope"

tags_extra = {
  env = "Prod"
}
