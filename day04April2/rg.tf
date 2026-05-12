terraform {
    required_providers {
        azurerm = {
        source  = "hashicorp/azurerm"
        version = "4.65.0"
        }
    }
}


provider "azurerm" {
  features {}

  
}

resource "azurerm_resource_group" "resource_group" {
  name     = "rg-humna222"
  location = "West Europe"
}

resource "azurerm_resource_group" "resource_group_prk" {
  name     = "rg-humna_prk"
  location = "West Europe"
}