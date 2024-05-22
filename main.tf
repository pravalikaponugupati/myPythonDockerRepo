provider "azurerm" {
features {}
}

resource "azurerm_resource_group" "acr-rg" {
name     = "acrresourcegroup"
location = "West US"
}

resource "azurerm_container_registry" "azurerm_container_registry" {
name                     = "acrcontainer"
resource_group_name      = azurerm_resource_group.acr-rg.name
location                 = azurerm_resource_group.acr-rg.location
sku                      = "Basic"
admin_enabled            = true
# Remove the "georeplication_locations" attribute
}



# resource "azurerm_app_service" "acr-app" {
# name                = "acrwebapp"
# location            = azurerm_resource_group.acr-rg.location
# resource_group_name = azurerm_resource_group.acr-rg.name
# app_service_plan_id = azurerm_app_service_plan.acr-rg.id

# site_config {
# always_on = true
# }

# app_settings = {
# "WEBSITE_HTTPLOGGING_RETENTION_DAYS" = "7"
# }
# }
