terraform {
  required_version = ">= 0.15.0"
  backend "azurerm" {}
}

provider "azurerm" {
  version = ">=2.0.0"
  features {}
}
