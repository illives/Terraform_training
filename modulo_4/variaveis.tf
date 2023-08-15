variable "namerg" {
  type        = string
  description = "Nome do resource group"
  default     = "rg-variaveis"

}


variable "location" {
  type        = string
  description = "Localizacao dos Recursos do Azure"
  //default     = "eastus"
}

variable "tags" {
  type        = map(any)
  description = "Tag nos recursos e serviços azure"
  default = {
    ambiente    = "desenvolvimento"
    responsavel = "nome do criador"
  }
}

variable "vnetenderecos" {
  type    = list(any)
  default = ["10.0.0.0/16", "192.168.0.0/16"]

}