variable "location" {
  type    = string
  default = "brazilsouth"
}

variable "tags" {
  type = map(any)
  default = {
    "ambiente" = "treinamento"
    "integraçãocontinua" = "ativada"
  }

}