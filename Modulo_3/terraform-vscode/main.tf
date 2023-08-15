provider "azurerm" {
  features {
  }
}

resource "azurerm_resource_group" "grupo_recurso" {
  name     = "bazinga"
  location = "brazilsouth"
}