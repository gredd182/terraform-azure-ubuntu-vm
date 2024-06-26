####################
## Network - Main ##
####################

# Create a resource group for network
resource "azurerm_resource_group" "network-rg" {
  name     = "network-rg"
  location = var.location
}

# Create the network VNET
resource "azurerm_virtual_network" "network-vnet" {
  name                = "network-vnet"
  address_space       = [var.network-vnet-cidr]
  resource_group_name = azurerm_resource_group.network-rg.name
  location            = azurerm_resource_group.network-rg.location
}

# Create a subnet for vm
resource "azurerm_subnet" "vm-subnet" {
  name                 = "vm-subnet"
  address_prefixes     = [var.vm-subnet-cidr]
  virtual_network_name = azurerm_virtual_network.network-vnet.name
  resource_group_name  = azurerm_resource_group.network-rg.name
}

