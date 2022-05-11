resource "azurerm_resource_group" "rg_rsv_test_advanced" {
  name     = "rg-test-rsv-advanced-resources"
  location = "uksouth"
}

resource "azurerm_log_analytics_workspace" "activity_logs" {
  name                = "UKS-LOG-SOFTCAT-MANAGEMENT"
  location            = azurerm_resource_group.rg_rsv_test_advanced.location
  resource_group_name = azurerm_resource_group.rg_rsv_test_advanced.name
  sku                 = "PerGB2018"
  depends_on          = [azurerm_resource_group.rg_rsv_test_advanced]
}


module "advanced_rsv" {
  source                                 = "../../"
  name                                   = "rsv-uks-test-advanced"
  location                               = "uksouth"
  resource_group_name                    = azurerm_resource_group.rg_rsv_test_advanced.name
  log_analytics_workspace                = azurerm_log_analytics_workspace.activity_logs.name
  log_analytics_workspace_resource_group = "rg-test-rsv-advanced-resources"
  storage_mode_type                      = "GeoRedundant"
  cross_region_restore_enabled           = false
  soft_delete_enabled                    = false
  sku                                    = "Standard"

  depends_on = [azurerm_resource_group.rg_rsv_test_advanced]

  backup_policies_vm = {
    daily-utc-0100 = {
      name      = "daily-0100-utc-test-advanced"
      frequency = "Daily"
      timezone  = "UTC"
      time      = "01:00"
      count     = 7
      weekdays  = []
    }

    weekly-utc-0100 = {
      name      = "weekly-0100-utc-test-advanced"
      frequency = "Weekly"
      timezone  = "UTC"
      time      = "01:00"
      count     = 7
      weekdays  = ["Monday"]
    }
  }
}
