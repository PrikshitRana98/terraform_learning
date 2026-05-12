terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
}

#################################################
# VARIABLE
#################################################

variable "resource_groups" {

  default = {

    rg1 = {
      location   = "westus"
      managed_by = "Team-A"

      tags = {
        env = "dev"
      }
    }

    rg2 = {
      location   = "eastus"
      managed_by = "Team-B"

      tags = {
        env = "prod"
      }
    }

    rg3 = {
      location   = "centralus"
      managed_by = "Team-C"

      tags = {
        env = "testing"
      }
    }

  }
}

#################################################
# MULTIPLE RESOURCE GROUP CREATION
#################################################

resource "azurerm_resource_group" "rg" {

  for_each = var.resource_groups

  name       = each.key
  location   = each.value.location
  managed_by = each.value.managed_by

  tags = each.value.tags
}