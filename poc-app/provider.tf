provider "azurerm" {
  subscription_id = "446247d4-0807-4bc1-9f14-14a3afad48de"
  features {}
}

terraform {
  required_version = ">= 1.1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }
  
  experiments = [module_variable_optional_attrs]

  backend "azurerm" {
    subscription_id      = "446247d4-0807-4bc1-9f14-14a3afad48de"
    resource_group_name  = "poc-modules"
    container_name       = "poc-app"
    storage_account_name = "trfrmstatestorage01"
    key                  = "terraform.tfstate"
  }
}
