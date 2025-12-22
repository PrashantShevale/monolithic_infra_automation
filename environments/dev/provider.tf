terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.52.0"
    }
  }
   backend "azurerm" {
    resource_group_name  = "rg-pasha"
    storage_account_name = "storagepasha"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}
provider "azurerm" {
  features {}
  subscription_id = "9e963c9c-03d9-4df6-b835-f7883659a89d"
    
  }