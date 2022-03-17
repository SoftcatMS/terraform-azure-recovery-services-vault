terraform {
  required_version = ">=1.0.0"

  # #Azurerm Backend https://www.terraform.io/docs/language/settings/backends/azurerm.html#
  # backend "azurerm" {
  #   resource_group_name  = "StorageAccount-ResourceGroup"
  #   storage_account_name = "abcd1234"
  #   container_name       = "tfstate"
  #   key                  = "path.to.terraform.tfstate"  
  # }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.99.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}
