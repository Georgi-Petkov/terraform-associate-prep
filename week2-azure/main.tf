terraform {
  required_version = ">= 1.12.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 5.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "rg-tf-associate-prep-azure-lab"
  location = "West Europe"

  tags = {
    learning = "true"
  }
}

resource "azurerm_storage_account" "example" {
  name                     = "storageaccountnamegvp999"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    learning = "true"
  }
}