# Configure the Azure Provider
provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  version = "=1.21.0"

  subscription_id = $ARM_SUBSCRIPTION_ID
  client_id       = $ARM_CLIENT_ID
  client_secret   = $ARM_CLIENT_SECRET
  tenant_id       = $ARM_TENANT_ID
}

# Create a resource group
resource "azurerm_resource_group" "test" {
  name     = "testpl"
  location = "West US"
}

# Create a virtual network within the resource group
resource "azurerm_virtual_network" "test" {
  name                = "production-network"
  resource_group_name = "${azurerm_resource_group.test.name}"
  location            = "${azurerm_resource_group.test.location}"
  address_space       = ["10.0.0.0/16"]
}
