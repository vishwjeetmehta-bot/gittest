terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 1.9.8"
    }
  }
}

provider "azurerm" {
  features {}
}