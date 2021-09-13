
locals {
  storage_account_name = "pipsharedinfrasa${var.env}"
}
data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}

module "sa" {
  source = "git::https://github.com/hmcts/cnp-module-storage-account.git?ref=master"

  env = var.env

  storage_account_name = local.storage_account_name
  common_tags          = var.common_tags
  ip_rules             = ["${chomp(data.http.myip.body)}"]

  resource_group_name = var.resource_group_name
  location            = var.location

  account_tier             = var.sa_account_tier
  account_kind             = var.sa_account_kind
  account_replication_type = var.sa_account_replication_type
  access_tier              = var.sa_access_tier

  team_name    = "PIP DevOps"
  team_contact = "#vh-devops"
}

resource "azurerm_storage_table" "distributionlist" {
  name                 = "distributionlist"
  storage_account_name = local.storage_account_name
}