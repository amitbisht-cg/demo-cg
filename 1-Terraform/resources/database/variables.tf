variable "resource_group_name" {
  description = "Name of the resource group to be imported."
}

variable "location" {
  description = "Azure Region where the gateway will be created"
}

variable "sqlserver_name" {
    description = "name of the SQL Server resource"
}

variable "sqldb_name" {
    description = "name of the SQL Database"
}

variable "env" {
    description = "name of the environment"
}