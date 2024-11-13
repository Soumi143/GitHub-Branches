## RG Creation
resource "azurerm_resource_group" "CloudquickPocsAPIM" {
    name     = "CloudquickPocsAPIM"
    location = "West Europe"
}

##API Management Creation
resource "azurerm_api_management" "CloudQuickPOCAPI" {
    name                = "CloudQuickPOCsPIM"
    location            = azurerm_resource_group.CloudquickPocsAPIM.location
    resource_group_name = azurerm_resource_group.CloudquickPocsAPIM.name
    publisher_name      = "CloudQuickPOCs"
    publisher_email     = "cloudquickpocs@nomail.com"

    sku_name = "Developer_1"
}

## An API within APIM
resource "azurerm_api_management_api" "CloudquickPocsAPIM" {
    name                = "cloudquickpocsapim-api"
    resource_group_name = azurerm_resource_group.CloudquickPocsAPIM.name
    api_management_name = azurerm_api_management.loudQuickPOCAPI.name
    revisiom            = "1"
    Display_name        = "MyFirstAPI"
    path                = ""
    protocols           = ["https", "http"]
    service_url         = "http://conferenceapi.azurewebsites.net"

    import {
    content_format = "swagger-link-json"
    content_value  = "http://conferenceapi.azurewebsites.net/?format=json" 
    }
}