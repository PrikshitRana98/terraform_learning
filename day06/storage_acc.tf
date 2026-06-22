
resource "azurerm_storage_account" "example" {
 
  name                     = "techtutorial102rn"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location # implicit dependency
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    # environment = local.common_tags.stage //var.environment
    environment = var.environment
  }
}

resource "azurerm_storage_account" "example02" {
 
  name                     = "techtutorial1002"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location # implicit dependency
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = local.common_tags.stage //var.environment
    # environment = var.environment
  }

  depends_on = [azurerm_storage_account.example]
}




