provider "azurerm" {
  features {

  }

}

resource "azurerm_resource_group" "grupo-recurso" {
  count    = 2
  location = "brazilsouth"
  name     = "rg-terraform-mod5-${count.index}"
  tags = {
    data        = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
    ambiente    = lower("QAS")
    responsavel = upper("William Souza Alves")
    tecnologia  = title("terraform")
  }
}

resource "azurerm_virtual_network" "vnet" {
  name                = "vnettreinamentoazure"
  location            = "brazilsouth"
  resource_group_name = "rg-terraform-mod5-1"
  address_space       = length(var.vnetips) == 0 ? ["10.0.0.0/16", "192.168.0.0/16"] : var.vnetips


}

variable "vnetips" {
  type    = list(any)
  default = ["10.0.0.0/8"]
}

output "vnet_numeoips" {
  value = length("${azurerm_virtual_network.vnet.address_space}")
}