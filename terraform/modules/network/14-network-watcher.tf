module "network_watcher_sa" {
  source = "git::https://github.com/hmcts/cnp-module-storage-account.git?ref=master"

  env = var.environment

  storage_account_name = "pipapimwatcher${var.environment}"
  common_tags          = var.tags

  default_action = "Allow"

  resource_group_name = var.resource_group
  location            = var.location

  account_tier              = "Standard"
  account_kind              = "StorageV2"
  account_replication_type  = "LRS"
  
  team_name    = "PIP DevOps"
  team_contact = "#vh-devops"
}

resource "azurerm_network_watcher_flow_log" "network_watcher_flow" {
  network_watcher_name = data.azurerm_network_watcher.network_watcher.name
  resource_group_name  = data.azurerm_network_watcher.network_watcher.resource_group_name

  network_security_group_id = azurerm_network_security_group.apim_nsg.id
  storage_account_id        = module.network_watcher_sa.storageaccount_id
  enabled                   = true
  version                   = 2

  retention_policy {
    enabled = true
    days    = var.environment == "sbox" || var.environment == "dev" || var.environment == "test" ? 30 : 60
  }

  traffic_analytics {
    enabled               = true
    workspace_id          = data.azurerm_log_analytics_workspace.hmcts.workspace_id
    workspace_region      = data.azurerm_log_analytics_workspace.hmcts.location
    workspace_resource_id = data.azurerm_log_analytics_workspace.hmcts.id
    interval_in_minutes   = var.environment == "sbox" || var.environment == "dev" || var.environment == "test" ? 60 : 10
  }
}
