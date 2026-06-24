# Network Security Group
resource "azurerm_network_security_group" "main" {}

# Key Vault
resource "azurerm_key_vault" "main" {}

# Role Assignments
resource "azurerm_role_assignment" "devops" {}


# Managed Identities
resource "azurerm_user_assigned_identity" "app" {}