terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.8.0"
    }
  }
}

provider "azurerm" {
    features {}

    
  
}


resource "azurerm_resource_group" "rg_prk" {
  name     = "rg_prk"
  location = "West Europe"
}

resource "azurerm_storage_account" "rg_storage" {
    name                     = "stprk"
    resource_group_name      = azurerm_resource_group.rg_prk.name
    location                 = azurerm_resource_group.rg_prk.location
    account_tier             = "Standard"
    account_replication_type = "LRS"
  
}