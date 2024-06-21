terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.108.0"
    }
  }


  backend "azurerm" {
    resource_group_name  = "technical-rg"  
    storage_account_name = "storageaccounttest"                      
    container_name       = "tfstate"                       
    key                  = "dev.terraform.tfstate"        
  }
}


provider "azurerm" {
  features {
    
  }
}