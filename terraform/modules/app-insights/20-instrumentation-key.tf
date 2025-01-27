data "azurerm_key_vault" "shared_keyvault" {
  name                = "pip-shared-kv-${var.environment}"
  resource_group_name = "pip-sharedservices-${var.environment}-rg"
}

resource "azurerm_key_vault_secret" "instrumentation_key" {
  name         = "appins-instrumentation-key"
  value        = azurerm_application_insights.app_insights.instrumentation_key
  key_vault_id = data.azurerm_key_vault.shared_keyvault.id
  tags         = var.tags
}