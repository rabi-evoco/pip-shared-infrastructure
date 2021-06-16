terraform {
  required_version = ">= 0.12.0"
  backend "azurerm" {}
}

provider "azurerm" {
  version = ">=2.0.0"
  features {}
}

provider "azurerm" {
  subscription_id = "bf308a5c-0624-4334-8ff8-8dca9fd43783"
  alias           = "log-analytics-subscription"
  version         = ">=2.0.0"
  features {}
}
