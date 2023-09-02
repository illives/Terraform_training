provider "azurerm" {
  features {

  }

}

resource "azurerm_resource_group" "rg" {
  name = "rg-terraform"
  location = "brazilsouth"
  tags = {
    "ambiente" = "treinamento"
  }
}

resource "azurerm_virtual_network" "vnet" {
  name = "virtual-import"
  resource_group_name = "rg-terraform"
  location = "brazilsouth"
  address_space = [ "10.0.0.0/16", "192.168.0.0/16" ]
  tags = {
    "ambiente" = "QAS" 
  }
}

resource "azurerm_network_security_group" "nsg" {
  
}