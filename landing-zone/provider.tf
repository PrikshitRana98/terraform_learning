terraform {
  required_version = ">= 1.8"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.0"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id = "8c8d7d4d-ce75-489c-bdc2-0a7c99a55dee"
}