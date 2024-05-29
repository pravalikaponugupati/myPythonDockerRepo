provider "azurerm" {
features {}
}

resource "azurerm_resource_group" "acr-rg" {
name     = "acrresourcegroup3"
location = "West US"
}

resource "azurerm_container_registry" "azurerm_registry" {
name                     = "acrcontainer2905"
resource_group_name      = azurerm_resource_group.acr-rg.name
location                 = azurerm_resource_group.acr-rg.location
sku                      = "Basic"
admin_enabled            = true
# Remove the "georeplication_locations" attribute
}

#resource "azurerm_app_service_plan" "acr-plan" {
#     name                = "acrplan"
#     location            = azurerm_resource_group.acr-rg.location
#     resource_group_name = azurerm_resource_group.acr-rg.name

#     sku {
#         tier = "Free"
#         size = "F1"
#     }
# }

# data "azurerm_key_vault" "acr-vault" {
#     name                = "acrvault"
#     resource_group_name = "acrresourcegroup1"
# }

# output "key_vault_id" {
#     value = data.azurerm_key_vault.acr-vault.id
# }

# resource "azurerm_app_service" "acr-app" {
#     name                = "acr-web-app"
#     location            = azurerm_resource_group.acr-rg.location
#     resource_group_name = azurerm_resource_group.acr-rg.name
#     app_service_plan_id = azurerm_app_service_plan.acr-plan.id

#     site_config {
#         always_on        = true
#         linux_fx_version = "DOCKER|${data.azurerm_container_registry.acr.name}.azurecr.io/DOCKER_IMAGE_NAME:DOCKER_IMAGE_TAG"
#     }

#     app_settings = {
#         "WEBSITE_HTTPLOGGING_RETENTION_DAYS" = "7"
#         "DOCKER_REGISTRY_SERVER_URL"         = "https://${data.azurerm_container_registry.acr.login_server}"
#         "DOCKER_REGISTRY_SERVER_USERNAME"    = "${data.azurerm_container_registry.acr.admin_username}"
#         "DOCKER_REGISTRY_SERVER_PASSWORD"    = "${data.azurerm_key_vault_secret.acr_password.value}"
#     }
# }
    
  
