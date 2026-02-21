# =============================================================================
# BACKEND - Remote state (Azure Blob)
# =============================================================================
# Storage account/key passed via -backend-config in CI. OIDC for auth (no secrets).

terraform {
  backend "azurerm" {
    use_azuread_auth = true
    use_oidc         = true
  }
}
