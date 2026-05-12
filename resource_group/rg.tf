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
  subscription_id = "your-subscription-id"
  
}

resource "azurerm_resource_group" "rg" {
  name     = "rh-hamna"
  location = "East US"
}