resource "azurerm_resource_group" "terraform_state_storage" {
  name     = var.rgname
  location = var.location
}

resource "azurerm_storage_account" "storage_account" {
  name                     = "trfrmstatestorage01"
  resource_group_name      = azurerm_resource_group.terraform_state_storage.name
  location                 = azurerm_resource_group.terraform_state_storage.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = var.env
  }
}

resource "azurerm_storage_container" "storage_account_state" {
  name                  = "poc-app"
  storage_account_name  = azurerm_storage_account.storage_account.name
  container_access_type = "blob"

  depends_on = [azurerm_storage_account.storage_account]
}