resource "azurerm_monitor_action_group" "pip-action-group" {
  name                = "pip-support"
  resource_group_name = var.resource_group
  short_name          = "pip-support"

  email_receiver {
    name          = "PIP Support Mailing List"
    email_address = var.support_email
  }

  tags = var.tags
}