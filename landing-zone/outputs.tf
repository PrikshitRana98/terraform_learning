output "vnet_id" {
  value = azurerm_virtual_network.main.id
}

output "keyvault_name" {
  value = azurerm_key_vault.main.name
}