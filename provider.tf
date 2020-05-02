variable "master_vm_1" {}
variable "worker_vm_1" {}
variable "worker_vm_2" {}
variable "username" {}
variable "ssh_public_key" {}
variable "resource_group" {}
variable "location" {}
variable "vm_size" {}
variable "managed_disk_type" {}
variable "ssh_key_target_path" {}


# Configure the Azure Provider
provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  version = "=2.0.0"
  features {}
}

resource "azurerm_resource_group" "vm" {
 name     = "var.resource_group-resources"
 location = var.location
 tags  =   {
   environment = "staging"
 }
}

resource "azurerm_virtual_network" "vm" {
  name                = "var.resource_group-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.vm.location
  resource_group_name = azurerm_resource_group.vm.name
}

resource "azurerm_subnet" "vm" {
  name                 = "var.resource_group-internal"
  resource_group_name  = azurerm_resource_group.vm.name
  virtual_network_name = azurerm_virtual_network.vm.name
  address_prefix       = "10.0.2.0/24"
}
/*                 #remove '/*' if you require public IP

resource "azurerm_public_ip" "vm" {
  name                    = "var.resource_group-public-ip"
  location                = azurerm_resource_group.vm.location
  resource_group_name     = azurerm_resource_group.vm.name
  allocation_method       = "Dynamic"
  idle_timeout_in_minutes = 30
  
}
*/                 #remove '/*' if you require public IP

resource "azurerm_network_interface" "vm" {
  name                = "var.resource_group-nic"
  location            = azurerm_resource_group.vm.location
  resource_group_name = azurerm_resource_group.vm.name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.vm.id
    private_ip_address_allocation = "Dynamic"
#    public_ip_address_id          = azurerm_public_ip.vm.id #Uncomment if you need Public IP to be allocated.
  }
}

