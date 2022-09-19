variable "resource_group_name" {
  description = "Name of the resource group."
}

variable "tfstorage_account"{
description = "Azure Storage account for storing terraform tfstate file"
}

variable "tfstatecontainer"{
description = "Azure Storage container for storing terraform tfstate file"
}

variable "location" {
  description = "Azure Region where all resources will be created"
}

variable "vnet_name" {
  description = "Name of the Azure Virtual Network"
}

variable "vnet_address" {
  type        = list(string)
  description = "The address space that is used by the virtual network."
  default     = ["10.0.0.0/16"]
}

variable "subnets" {
  description = "List of Subnets to be created"
  type = list(object({
    name = string
    address = list(string)
  }))
}

## SQL Server and SQL Database variables
variable "sqlserver_name" {
    description = "Name of the SQL Server resource"
}

variable "sqldb_name" {
    description = "Name of the SQL Database"
}

variable "env" {
    description = "name of the environment"
}

variable "web_prefix" {
  description = "Prefix of Web Virtual Machines"
}

variable "app_prefix" {
  description = "Prefix of App Virtual Machines"
}

variable "web_count" {
  description = "Number of Web servers to be created"
}

variable "app_count" {
  description = "Number of App servers to be created"
}

variable "vm_size" {
    description = "Size of the Virtual Machines"
}