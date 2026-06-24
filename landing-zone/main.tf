resource "azurerm_resource_group" "network" {
  name     = "rg-network-prod"
  location = var.location
}