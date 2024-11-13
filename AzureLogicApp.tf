##Azure RG
resource "azurerm_resource_group" "myrgcloudquickpocs"{
    name     = "cloudquickpocsrg001"
    location = "East US"
}
    


##Azure Logic App
resource "azurerm_logic_app_workflow" "cloudquickpocslogicapp"{
    name                = "cloudquickpocslogicapp1"
    location            = azurerm_resource_group.myrgcloudquickpocs.location
    resource_group_name = azurerm_resource_group.myrgcloudquickpocs.name
}

## A custom action in logic App
resource "azurerm_logic_app_action_custom" "cloudquickpocslogicappcustomaction"{
    name         = "cloudquickpocslogicapp1-custom-action-1"
    logic_app_id = azurerm_logic_app_workflow.cloudquickpocslogicapp.logic_app_id

    body = <<body

{
    "description": "A variable to configure the auto expiration age in days."
    "inputs": {
        "variables": [
            {
                "name": "ExpirationAgeInDays"
                "type": "Integer"
                "value": -30
            }
        ]
    },
    "runAfter": {},
    "type": "Initializevariable"
}   
BODY

}