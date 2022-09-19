terraform {
  backend "azurerm" {
    resource_group_name             = "demo-rg"
    storage_account_name            = "demostorageaccount0093"
    container_name                  = "demotfcontainer"
    key                             = "terraform.tfstate"
  }
}

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "=3.1.0"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration        = true
}

module "vnet" {
  source                            = "./resources/network/vnet"
  location                          = var.location
  resource_group_name               = var.resource_group_name
  vnet_name                         = var.vnet_name
  address_space                     = var.vnet_address
  subnets                           = var.subnets
  env                               = var.env
}

module "web_vm" {
  source                            = "./resources/compute"
  resource_group_name               = var.resource_group_name
  location                          = var.location
  vmcount                           = var.web_count
  vm_prefix                         = var.web_prefix
  vm_size                           = var.vm_size
  env                               = var.env
  vm_subnet_id                      = values(module.vnet.subnet_ids)[0].id
}

module "app_vm" {
  source                            = "./resources/compute"
  resource_group_name               = var.resource_group_name
  location                          = var.location
  vmcount                           = var.app_count
  vm_prefix                         = var.app_prefix
  vm_size                           = var.vm_size
  env                               = var.env
  vm_subnet_id                      = values(module.vnet.subnet_ids)[1].id
}

module "sqlserver" {
  source                            = "./resources/database"
  resource_group_name               = var.resource_group_name
  location                          = var.location
  sqlserver_name                    = var.sqlserver_name
  sqldb_name                        = var.sqldb_name
  env                               = var.env
}

