data "azurerm_key_vault" "shared_kv" {
  name                = "pip-shared-kv-${var.environment}"
  resource_group_name = "pip-sharedservices-${var.environment}-rg"
}

data "azurerm_key_vault_secret" "pact_password" {
  name         = "pact-db-password"
  key_vault_id = data.azurerm_key_vault.shared_kv.id
}
