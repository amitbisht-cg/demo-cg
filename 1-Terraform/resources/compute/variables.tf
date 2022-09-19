variable "resource_group_name" {
  description = "Name of the resource group to be imported."
}

variable "location" {
  description = "Azure Region where the gateway will be created"
}

variable "vmcount" {
    description = "number of VMs to be created"
}

variable "env" {
    description = "name of the environment"
}

variable "vm_prefix" {
    description = "Prefix of Vitual Machine to be created"
}

variable "vm_size" {
    description = "Size of the Virtual Machines"
}

variable "vm_subnet_id" {
  description = "Subnet ID of the Virtual Machines"
}