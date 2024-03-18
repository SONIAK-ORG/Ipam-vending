# Use variables to customize the deployment

variable "root_id" {
  type        = string
  description = "Sets the value used for generating unique resource naming within the module."
  default = "LZ"
}

variable "root_name" {
  type        = string
  description = "Sets the value used for the \"intermediate root\" management group display name."
  default = "Landing-zone"
}

variable "primary_location" {
  type        = string
  description = "Sets the location for \"primary\" resources to be created in."
   default     = "northeurope"
}

variable "secondary_location" {
  type        = string
  description = "Sets the location for \"secondary\" resources to be created in."
   default     = "westeurope"
}



variable "subscription_id" {
  type        = string
  description = "Subscription ID to use for \"connectivity\" resources."
  default = "9a8b2ebf-21ca-4149-b306-60c058027448"
}


variable "address_space" {
  type    = list(string)
  default = ["10.0.0.0/16"]
}


 variable "virtual_networks_name" {
  type        = string
  description = "Subscription ID to use for \"connectivity\" resources."
  default = "LZ-network"
}


 variable "resource_group_name" {
  type        = string
  description = "resource_group_name"
  default = "LZ-Test_RG"
}



 variable "vnet_tag" {
  type        = string
  description = "tag"
}


 variable "address_prefix" {
  type        = string
  description = "addresss"
}





variable "enable_vnet_peering" {
    type        = bool
    description = "enable_vnet_peering"
    default     = false
  }
