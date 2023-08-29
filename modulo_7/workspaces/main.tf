terraform {
  backend "azurerm" {
    resource_group_name  = "terraformstate"
    storage_account_name = "trfstateaztreinamento"
    container_name       = "terraformstate"
    key                  = "7Ujta5N64DSu1IAHUgKR4qiVzaVlfS7wogRDpYQ3IHwOH/3KNDtTQE6qWrNxKOmfYm8bOVHw8WL6+AStLvj3Ug=="
  }
}

variable "location" {
  type    = string
  default = "brazilsouth"
}

provider "azurerm" {
  features {

  }
}


resource "azurerm_resource_group" "rg" {
  name     = "appservice-${terraform.workspace}"
  location = var.location
}

resource "azurerm_app_service_plan" "plan" {
  name                = "appserviceplan${terraform.workspace}"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "appservice" {
  name                = "tfappservicemm-${terraform.workspace}"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.plan.id

  site_config {
    dotnet_framework_version = "v4.0"
  }

  app_settings = {
    "chave" = "123456"
  }
}