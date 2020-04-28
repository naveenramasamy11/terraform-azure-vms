variable "master_vm_1" {}
variable "worker_vm_1" {}
variable "worker_vm_2" {}


# Configure the Azure Provider
provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  version = "=2.0.0"
  features {}
}

resource "azurerm_resource_group" "kubernetes" {
 name     = "kubernetes-resources"
 location = "East US"
 tags  =   {
   environment = "staging"
   version      = "v18"
 }
}

resource "azurerm_virtual_network" "kubernetes" {
  name                = "${var.worker_vm_2}-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.kubernetes.location
  resource_group_name = azurerm_resource_group.kubernetes.name
}

resource "azurerm_subnet" "internal-kubernetes" {
  name                 = "internal-kubernetes"
  resource_group_name  = azurerm_resource_group.kubernetes.name
  virtual_network_name = azurerm_virtual_network.kubernetes.name
  address_prefix       = "10.0.2.0/24"
}

resource "azurerm_network_interface" "kubernetes" {
  name                = var.worker_vm_2
  location            = azurerm_resource_group.kubernetes.location
  resource_group_name = azurerm_resource_group.kubernetes.name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.internal-kubernetes.id
    private_ip_address_allocation = "Dynamic"
  }
}

