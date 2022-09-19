resource "azurerm_network_interface" "nic" {
    name                                = "${var.vm_prefix}-nic-${count.index}"
    count                               = var.vmcount
    resource_group_name                 = var.resource_group_name
    location                            = var.location
    ip_configuration {
        name                            = "${var.vm_prefix}-config-${count.index}"
        subnet_id                       = var.vm_subnet_id
        private_ip_address_allocation   = "Dynamic"
    }
    tags = {
        env =  var.env
    }
}

resource "azurerm_virtual_machine" "vm" {
    name                                = "${var.vm_prefix}-${count.index}"
    count                               = var.vmcount
    resource_group_name                 = var.resource_group_name
    location                            = var.location
    network_interface_ids               = ["${element(azurerm_network_interface.nic.*.id, count.index)}"]
    vm_size                             = var.vm_size
    
    storage_image_reference {
        publisher                       = "Canonical"
        offer                           = "UbuntuServer"
        sku                             = "16.04-LTS"
        version                         = "Latest"
    }

    os_profile {
        computer_name                   = "${var.vm_prefix}-${count.index}"
        admin_username                  = "azureadmin9"
        admin_password                  = "SecurePass#97"
    }

    os_profile_linux_config {
        disable_password_authentication = false
    }

    storage_os_disk {
        name                            = "${var.vm_prefix}-disk-${count.index}"
        create_option                   = "FromImage"
    }

    tags = {
        env =  var.env
    }
}