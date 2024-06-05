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
   default     = "eastus"
}

variable "secondary_location" {
  type        = string
  description = "Sets the location for \"secondary\" resources to be created in."
   default     = "westeurope"
}


variable "resource_group_name"{
type        = string
default     = "LZ-Test_RG"

}




#variable "subscription_id" {
#  type        = string
#  description = "Subscription ID to use for \"landing zone\" resources."
#  default = "f1da52e0-2221-4ee6-95ce-6929331d7777"
#}



 variable "virtual_networks_name" {
  type        = string
  description = "Subscription ID to use for \"connectivity\" resources."
  default = "LZ-network"
}

  



 variable "vnet_tag" {
  type        = string
  description = "tag"
}


 variable "address_prefix" {
  type        = list(string)
  description = "addresss"
}





variable "enable_vnet_peering" {
    type        = bool
    description = "enable_vnet_peering"
    default     = false
  }
