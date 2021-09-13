terraform {
  required_version = ">= 1.0.4"
  backend "azurerm" {}
}

provider "azurerm" {
  version = ">=2.0.0"
  features {}
}
