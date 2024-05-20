provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name = "acr-resource-group"
  location = azurerm_location.eastus.location
}

resource "azurerm_location" "eastus" {
  name = "East US"
}

resource "azurerm_container_registry" "acr" {
  name                = "acr-demo"
  resource_group_name  = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku {
    name = "Standard" # Choose sku based on your needs (Basic, Standard, Premium)
  }
  admin_enabled = true # Optional: Disable for production environments
  tags = {
    environment = "dev" # Add tags for better organization
  }
}
