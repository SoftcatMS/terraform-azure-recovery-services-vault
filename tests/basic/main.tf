resource "azurerm_resource_group" "rg-rsv-test-basic" {
  name     = "rg-test-rsv-basic-resources"
  location = "uksouth"
}


module "basic_rsv" {
  source                       = "../../"
  name                         = "rsv-uks-test-basic"
  location                     = "uksouth"
  resource_group_name          = azurerm_resource_group.rg-rsv-test-basic.name
  storage_mode_type            = "GeoRedundant"
  cross_region_restore_enabled = false
  soft_delete_enabled          = false
  sku                          = "Standard"

  depends_on = [azurerm_resource_group.rg-rsv-test-basic]

  backup_policies_vm = {
    daily-utc-0100 = {
      name              = "daily-0100-utc-test-basic"
      frequency         = "Daily"
      retention_monthly = false
      retention_yearly  = false
      timezone          = "UTC"
      time              = "01:00"
      count             = 7
      weeks             = []
      weekdays          = []
      months            = []
    }
    # weekly-utc-0100 = {
    #   name              = "weekly-0100-utc-test-basic"
    #   frequency         = "Weekly"
    #   retention_monthly = false
    #   retention_yearly  = false
    #   timezone          = "UTC"
    #   time              = "01:00"
    #   count             = 7
    #   weeks             = []
    #   weekdays          = ["Monday"]
    #   months            = []
    # }
    # monthly-utc-0100 = {
    #   name              = "monthly-0100-utc-test-basic"
    #   frequency         = "Daily"
    #   retention_monthly = true
    #   retention_yearly  = false
    #   timezone          = "UTC"
    #   time              = "01:00"
    #   count             = 7
    #   weekdays          = ["Monday"]
    #   weeks             = ["First"]
    #   months            = []
    # },
    # yearly-utc-0100 = {
    #   name              = "yearly-0100-utc-test-basic"
    #   frequency         = "Weekly"
    #   retention_monthly = false
    #   retention_yearly  = true
    #   timezone          = "UTC"
    #   time              = "01:00"
    #   count             = 7
    #   weekdays          = ["Monday"]
    #   weeks             = ["First"]
    #   months            = ["January"]
    # }
  }
}



# resource "azurerm_backup_policy_vm" "backup_policy" {
#   name                = "weekly"
#   resource_group_name = azurerm_resource_group.rg-rsv-test-basic.name
#   recovery_vault_name = "rsv-uks-test-basic"
#   timezone            = "UTC"


#   backup {
#     frequency = "Weekly"
#     time      = "02:00"
#   }

#   retention_weekly {
#     count    = 7
#     weekdays = ["Saturday"]
#   }
# }
