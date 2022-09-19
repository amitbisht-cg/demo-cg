variable "vnet_name" {
  description = "Name of the vnet to create"
  default     = ""
}

variable "resource_group_name" {
  description = "Name of the resource group to be imported."
}

variable "location" {
  description = "Azure Region where the gateway will be created"
}

variable "address_space" {
  type        = list(string)
  description = "The address space that is used by the virtual network."
  default     = ["10.0.0.0/16"]
}

variable "subnets" {
  type = list(object({
    name = string
    address = list(string)
  }))
}

variable "env" {
    description = "name of the environment"
}