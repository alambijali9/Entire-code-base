vnet={

  name                = "network1"
  location            = "centralindia"
  resource_group_name = "technical-rg"
  address_space       = ["10.0.0.0/16"]

}

sub={

sub1={
  name                 = "frontend-subnet"
  resource_group_name  = "technical-rg"
  virtual_network_name = "network1"
  address_prefixes     = ["10.0.1.0/24"]

}

sub2={
  name                 = "backend-subnet"
  resource_group_name  = "technical-rg"
  virtual_network_name = "network1"
  address_prefixes     = ["10.0.2.0/24"]

}
sub3={
  name                 = "AzureBastionSubnet"
  resource_group_name  = "technical-rg"
  virtual_network_name = "network1"
  address_prefixes     = ["10.0.2.0/24"]

}
}

vm = {

  vm1 = {

    nic-name            = "vm1-nic"
    location            = "centralindia"
    resource_group_name = "technical-rg"
    nsg-name            = "nsg1"
    vm-name             = "vm1"
    size                = "Standard_F2"
    admin_username      = "adminuser"
    admin_password      = "MjNdNQ0&2%1&"
   subnet-name="frontend-subnet"
   virtual_network_name="network1"


  },

  vm2 = {

    nic-name            = "vm2-nic"
    location            = "centralindia"
    resource_group_name = "technical-rg"
    nsg-name            = "nsg2"
    vm-name             = "vm2"
    size                = "Standard_F2"
    admin_username      = "adminuser"
    admin_password      = "MjNdNQ0&2%1&"
   subnet-name="frontend-subnet"
   virtual_network_name="network1"


  }

}
key = {

  name                = "smartkeyvault"
  location            = "centralindia"
  resource_group_name = "technical-rg"
  sku-name            = "standard"


}
bastion = {
  pip-name             = "bastion-pip"
  location             = "centralindia"
  resource_group_name  = "technical-rg"
  allocation_method    = "Static"
  sku                  = "Standard"
  bastion-name         = "frontend-bastion"
  subnet-name          = "AzureBastionSubnet"
  virtual_network_name = "network1"



}
sql = {

  server-name                  = "ms-sqlserver"
  resource_group_name          = "technical-rg"
  location                     = "centralindia"
  version                      = "12.0"
  administrator_login          = "adminuser"
  administrator_login_password = "MjNdNQ0&2%1&"
  database-name                = "mysqldatabase"


}

lb = {

  pip_name                 = "PublicIPForLB"
  location                 = "centralindia"
  resource_group_name      = "technical-rg"
  allocation_method        = "Static"
  lb_name                  = "fend-loadbalancer"
  pip_sku                  = "standard"
  lb_sku                   = "standard"
  front-ip-config-name     = "PublicIPAddress"
  lb_bkpool-address-name-1 = "backend-nic-address1"
  lb_bkpool-address-name-2 = "backend-nic-address2"
  vnet_name                = "network1"
  nic1_name                = "vm1-nic"
  nic2_name                = "vm2-nic"
}

dyna-vnet = {

  vnet = {

    name                = "dynamic-net"
    location            = azurerm_resource_group.example.location
    resource_group_name = azurerm_resource_group.example.name
    address_space       = ["192.168.0.0/16"]
    subnets = {

      snet1 = {
        name           = "subnet1"
        address_prefix = "192.168.1.0/24"
      }
        snet2 = {
        name           = "subnet2"
        address_prefix = "192.168.2.0/24"
      }

    }

  }

}

dyna-nsg = {

  nsg1 = {

    name                = "dynamic-nsg"
    location            = "centralindia"
    resource_group_name = "technical-rg"
    security_rule = {

      rule1 = {

        name                       = "test123"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "*"
        destination_address_prefix = "*"

      }

    }


  }

}


