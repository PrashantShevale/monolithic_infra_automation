rg = {
  rg1 = {
    name       = "rg-todoapp24"
    location   = "centralindia"
    managed_by = "terraform"
    tags = {
      environment = "dev"
    }
  }
}

vnets = {
  vnet1 = {
    name                = "vnet-todoapp"
    location            = "Central India"
    resource_group_name = "rg-todoapp24"
    address_space       = ["10.0.0.0/16"]
    tags = {
      environment = "dev"
    }
    subnets = [
      {
        name           = "frontend-subnet"
        address_prefix = ["10.0.1.0/24"]
      }
      ,
      {
        name           = "backend-subnet"
        address_prefix = ["10.0.2.0/24"]
      }
    ]
  }
}
nic = {
  nic1 = {
    name                 = "nic1-todoapp-frontend"
    location             = "Central India"
    resource_group_name  = "rg-todoapp24"
    subnet_name          = "frontend-subnet"
    virtual_network_name = "vnet-todoapp"
    pip_name             = "pip1-todoapp-frontend"

    tags = {
      environment = "dev"
    }

    ip_configurations = {
      ipconfig1 = {
        name                          = "internal"
        private_ip_address_allocation = "Dynamic"
        private_ip_address_version    = "IPv4"
        primary                       = true
      }
    }
  }

  nic2 = {
    name                 = "nic2-todoapp-backend"
    location             = "Central India"
    resource_group_name  = "rg-todoapp24"
    subnet_name          = "backend-subnet"
    virtual_network_name = "vnet-todoapp"
    pip_name             = "pip2-todoapp-backend"

    tags = {
      environment = "dev"
    }

    ip_configurations = {
      ipconfig2 = {
        name                          = "internal"
        private_ip_address_allocation = "Dynamic"
        private_ip_address_version    = "IPv4"
        primary                       = true
      }
    }
  }
}

pips = {
  pip1 = {
    pip_name            = "pip1-todoapp-frontend"
    resource_group_name = "rg-todoapp24"
    location            = "Central India"
    sku                 = "Standard"
    allocation_method   = "Static"
    tags = {
      environment = "dev"

    }
  }
  pip2 = {
    pip_name            = "pip2-todoapp-backend"
    resource_group_name = "rg-todoapp24"
    location            = "Central India"
    sku                 = "Standard"
    allocation_method   = "Static"
    tags = {
      environment = "dev"
    }
  }
}

nsgs = {
  nsg1 = {
    nsg_name            = "frontend-nsg-todoapp"
    location            = "Central India"
    resource_group_name = "rg-todoapp24"
    tags = {
      environment = "dev"
    }

    security_rules = [
      {
        name                       = "Allow-SSH"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ],
    security_rules = [
      {
        name                       = "Allow-HTTP"
        priority                   = 1002
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]
  }

  nsg2 = {
    nsg_name            = "backend-nsg-todoapp"
    location            = "Central India"
    resource_group_name = "rg-todoapp24"
    tags = {
      environment = "dev"
    }

    security_rules = [
      {
        name                       = "Allow-SSH"
        priority                   = 1003
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ],
    security_rules = [
      {
        name                       = "Allow-HTTP"
        priority                   = 1004
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]
  }
}

nic_nsg_associations = {
  Association1 = {
    nic_name            = "nic1-todoapp-frontend"
    nsg_name            = "frontend-nsg-todoapp"
    resource_group_name = "rg-todoapp24"

  }
  Association2 = {
    nic_name            = "nic2-todoapp-backend"
    nsg_name            = "backend-nsg-todoapp"
    resource_group_name = "rg-todoapp24"
  }
}



vms = {
  vm1 = {
    name                            = "vm-todoapp-frontend"
    location                        = "Central India"
    resource_group_name             = "rg-todoapp24"
    vm_size                         = "Standard_B1s"
    disable_password_authentication = false
    nic_name                        = "nic1-todoapp-frontend"
    kv_name                         = "kv-todoapp-pasha"
    vm_username_secret_name         = "vm1-username"
    vm_password_secret_name         = "password1"
    provision_vm_agent              = true

    source_image_reference = {
      publisher = "Canonical"
      offer     = "UbuntuServer"
      sku       = "20.04-LTS"
      version   = "latest"
    }

    os_disk = [
      {
        name                 = "vm-todoapp-frontend-osdisk"
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
        disk_size_gb         = 30
      }
    ]

    admin_ssh_keys = []
    tags = {
      environment = "dev"
    }
  }

  vm2 = {
    name                            = "vm-todoapp-backend"
    location                        = "Central India"
    resource_group_name             = "rg-todoapp24"
    vm_size                         = "Standard_B1s"
    disable_password_authentication = false
    nic_name                        = "nic2-todoapp-backend"
    kv_name                         = "kv-todoapp-pasha"
    vm_username_secret_name         = "vm2-username"
    vm_password_secret_name         = "password2"
    provision_vm_agent              = true
    source_image_reference = {
      publisher = "Canonical"
      offer     = "UbuntuServer"
      sku       = "20.04-LTS"
      version   = "latest"
    }

    os_disk = [
      {
        name                 = "vm-todoapp-backend-osdisk"
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
        disk_size_gb         = 30
      }
    ]

    admin_ssh_keys = []
    tags = {
      environment = "dev"
    }
  }
}

kv = {
  kv1 = {
    name                            = "kv-todoapp-pasha"
    location                        = "Central India"
    resource_group_name             = "rg-todoapp24"
    sku_name                        = "standard"
    enabled_for_deployment          = true
    enabled_for_disk_encryption     = true
    enabled_for_template_deployment = false
    purge_protection_enabled        = true
    soft_delete_retention_days      = 7
    tags = {
      environment = "dev"
    }
    access_policy = [
      {

        key_permissions         = ["Get", "List", "Create", "Delete"]
        secret_permissions      = ["Get", "List", "Set", "Delete", "Recover"]
        certificate_permissions = ["Get", "List", "Create"]
        storage_permissions     = ["Get", "List"]
      }
    ]
  }
}

kv_secrets = {
  secret1 = {
    kv_name             = "kv-todoapp-pasha"
    resource_group_name = "rg-todoapp24"
    secret_name         = "vm1-username"
    secret_value        = "Darshil@123"
    tags = {
      environment = "dev"
    }

  },
  secret2 = {
    kv_name             = "kv-todoapp-pasha"
    resource_group_name = "rg-todoapp24"
    secret_name         = "vm2-username"
    secret_value        = "Darshil@456"
    tags = {
      environment = "dev"
    }
  },
  secret3 = {
    kv_name             = "kv-todoapp-pasha"
    resource_group_name = "rg-todoapp24"
    secret_name         = "password1"
    secret_value        = "Pasha@123"
    tags = {
      environment = "dev"
    }
  },
  secret4 = {
    kv_name             = "kv-todoapp-pasha"
    resource_group_name = "rg-todoapp24"
    secret_name         = "password2"
    secret_value        = "Pasha@456"
    tags = {
      environment = "dev"
    }
  }

}

sql_servers = {
  sql1 = {
    name                                     = "sqlserver-todoapp-darshil"
    resource_group_name                      = "rg-todoapp24"
    location                                 = "Central India"
    version                                  = "12.0"
    kv_name                                  = "kv-todoapp-pasha"
    administrator_login                      = "server24"
    administrator_login_password             = "Darshil@12345"
    connection_policy                        = "Default"
    express_vulnerability_assessment_enabled = true
    minimum_tls_version                      = "1.2"
    public_network_access_enabled            = true
    outbound_network_restriction_enabled     = false

    identity = [
      {
        type         = "SystemAssigned"
        identity_ids = []
      }
    ]

    tags = {
      environment = "dev"

    }
  }
}


sql_databases = {
  sql_db1 = {
    name                = "sqldb-todoapp-darshil"
    server_name         = "sqlserver-todoapp-darshil"
    resource_group_name = "rg-todoapp24"
    location            = "Central India"
    sku_name            = "S0"
    max_size_gb         = 10
    read_scale          = false
    zone_redundant      = false
    collation           = "SQL_Latin1_General_CP1_CI_AS"
    create_mode         = "Default"


    tags = {
      environment = "dev"

    }
  }
}


