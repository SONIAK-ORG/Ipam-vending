terraform {
  backend "azurerm" {
    resource_group_name   = "Terraform-State"
    storage_account_name  = "mytfstatestoragealz"
    container_name        = "tfstate"
    key                   = "terraform.tfstate"
    #use_oidc              = true
    #subscription_id = "6ab5ad42-6a7d-4f21-a926-9ce61b67df96"
    #tenant_id       = "832b0908-3585-4294-a01c-7763fc195006"
  }
}
