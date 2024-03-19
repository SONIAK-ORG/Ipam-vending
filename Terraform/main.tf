terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.7.0"
    }
  }
}

provider "azurerm" {
 features {}

subscription_id = "6ab5ad42-6a7d-4f21-a926-9ce61b67df96"
client_id       = "9ffdadd5-6a69-418a-b754-4689fd9afa7a"
tenant_id       = "832b0908-3585-4294-a01c-7763fc195006"
use_oidc = true
}

module "lz_vending" {
  source  = "Azure/lz-vending/azurerm"
  version = "~>3.4.1" # change this to your desired version, https://www.terraform.io/language/expressions/version-constraints

  location = var.primary_location
  subscription_id = var.subscription_id

  network_watcher_resource_group_enabled = true

  # management group association variables
  subscription_management_group_association_enabled = true
  subscription_management_group_id                  = "es-landing-zones"

  # virtual network variables
  virtual_network_enabled = true
  virtual_networks = {
    vnet1 = {
      name                    = var.virtual_networks_name
      address_space           = var.address_space
      resource_group_name     = var.resource_group_name
      hub_peering_enabled     = var.enable_vnet_peering
      hub_network_resource_id = "/subscriptions/1ba2c686-9231-4bfd-bb2e-aadb1309cfac/resourceGroups/slz-connectivity-westeurope/providers/Microsoft.Network/virtualNetworks/slz-hub-westeurope"
      hub_peering_use_remote_gateways = false
    }
  }
}

