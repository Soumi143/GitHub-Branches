#ARM provider block
provider "azurerm" {
    version = "~>2.0"
    features{}
}

# Terraform backend config block -statefile
terraform {
    backend "azurerm" {
        resource_group_name  = "rg-cloudquickpocs"
        storage_account_name = "ccpsazuretf0001"
        container_name       = "ccpterraformstatefile"
        key                  = "ccpsterraform.tfstate"
    }
}