terraform {
  backend "azurerm" {
    resource_group_name  = "terraformstate"
    storage_account_name = "trfstateaztreinamento"
    container_name       = "terraformstate"
    key                  = "gDuaVkFAheSxjWWGr9B6r3M7fIO9nTdgOZVPLpji7gpfUsaWFfJrLG7ETLgQrqdSJQJPjEY90X/t+ASt12QDGg=="
  }
}

provider "azurerm" {
  features {
  }
}

resource "azurerm_resource_group" "rg-state" {
  name     = "rg_terraform_com_state"
  location = "brazilsouth"
}