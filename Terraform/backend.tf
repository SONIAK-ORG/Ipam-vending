terraform {
  backend "azurerm" {
    resource_group_name   = "terraform-lz-rg"
    storage_account_name  = "lamdingzonesa"
    container_name        = "tfstate"
    key                   = "terraform.tfstate"
  }
}