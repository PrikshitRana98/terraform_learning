terraform {
    backend "azurerm" {
    resource_group_name  = "tfstate-day04"
    storage_account_name = "day0422480" 
    container_name = "tfstate"    
    key = "demo.terraform.tfstate"       
  }
}