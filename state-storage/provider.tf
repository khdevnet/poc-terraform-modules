provider "azurerm" {
  subscription_id = "446247d4-0807-4bc1-9f14-14a3afad48de"
  features {}
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}