data "azurerm_network_watcher" "network_watcher" {
  name                = "NetworkWatcher_${var.location}"
  resource_group_name = "NetworkWatcherRG"
}

data "azurerm_log_analytics_workspace" "hmcts" {
  provider            = var.log-analytics-subscription_id
  name                = var.log_analytics_workspace_name
  resource_group_name = var.log_analytics_workspace_rg
}
