provider "azurerm" {
  features {

  }

}

resource "azurerm_resource_group" "rg" {
  name     = "rg-keyvault"
  location = "brazilsouth"
}

data "azurerm_client_config" "current" {

}

resource "azurerm_key_vault" "keyvault" {
  name                = "keyvaulttfillives"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = "premium"
  soft_delete_retention_days = 7

  access_policy {
    key_permissions         = ["Create", "Get", "List"]
    object_id               = data.azurerm_client_config.current.object_id
    tenant_id               = data.azurerm_client_config.current.tenant_id
    certificate_permissions = ["List"]
    secret_permissions      = ["Set", "Get", "Delete", "Purge", "Recover", "List"]
  }
}

resource "azurerm_key_vault_secret" "secret" {
  name            = "secret-terraform"
  value           = "secret4321098=!"
  key_vault_id    = azurerm_key_vault.keyvault.id
  expiration_date = "2023-12-31T00:00:00Z"
}

data "azurerm_key_vault_secret" "getsecret" {
  name         = "secret-terraform"
  key_vault_id = azurerm_key_vault.keyvault.id
}

output "secret_value" {
  value     = data.azurerm_key_vault_secret.getsecret.value
  sensitive = true
}

output "keyvault_url" {
  value = azurerm_key_vault.keyvault.vault_uri
}


