resource "azurerm_virtual_machine" "vm2" {
  name                  = var.worker_vm_1
  location              = azurerm_resource_group.vm.location
  resource_group_name   = azurerm_resource_group.vm.name
  network_interface_ids = [azurerm_network_interface.vm.id]
  vm_size               = var.vm_size

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  # delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "RedHat"
    offer     = "RHEL"
    sku       = "7-LVM"
    version   = "latest"
  }

  storage_os_disk {
    name              = var.worker_vm_1
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = var.managed_disk_type
  }

  os_profile {
    computer_name  = var.worker_vm_1
    admin_username = var.username
  }

  os_profile_linux_config {
    disable_password_authentication = true
    ssh_keys {
        key_data = file(var.ssh_public_key)
        path = var.ssh_key_target_path

    }
  }
}