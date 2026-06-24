# Virtual Network
resource "azurerm_virtual_network" "main" {
  name                = "prod-vnet"
  address_space       = var.vnet_address_space
  location            = var.location
  resource_group_name = azurerm_resource_group.network.name
}


# Subnet
resource "azurerm_subnet" "app" {
  name                 = "app-subnet"
  resource_group_name  = azurerm_resource_group.network.name
  virtual_network_name = azurerm_virtual_network.main.name

  address_prefixes = ["10.0.1.0/24"]
}


# Route Table


resource "azurerm_route_table" "main" {}

# Firewall
resource "azurerm_firewall" "main" {}