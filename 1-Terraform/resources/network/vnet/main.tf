resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  tags = {
        env =  var.env
    }
}

resource "azurerm_subnet" "subnet" {
  for_each = {for subnet in var.subnets: subnet.name => subnet}
  
  name                 = each.value.name
  address_prefixes     = each.value.address
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
}