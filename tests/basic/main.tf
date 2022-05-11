resource "azurerm_resource_group" "rg_rsv_test_basic" {
  name     = "rg-test-rsv-basic-resources"
  location = "uksouth"
}

resource "azurerm_log_analytics_workspace" "activity_logs" {
  name                = "UKS-LOG-SOFTCAT-MANAGEMENT"
  location            = azurerm_resource_group.rg_rsv_test_basic.location
  resource_group_name = azurerm_resource_group.rg_rsv_test_basic.name
  sku                 = "PerGB2018"
  depends_on          = [azurerm_resource_group.rg_rsv_test_basic]
}


module "basic_rsv" {
  source                                 = "../../"
  name                                   = "rsv-uks-test-basic"
  location                               = "uksouth"
  resource_group_name                    = azurerm_resource_group.rg_rsv_test_basic.name
  log_analytics_workspace                = azurerm_log_analytics_workspace.activity_logs.name
  log_analytics_workspace_resource_group = "rg-test-rsv-basic-resources"
  storage_mode_type                      = "GeoRedundant"
  cross_region_restore_enabled           = false
  soft_delete_enabled                    = false
  sku                                    = "Standard"

  depends_on = [azurerm_resource_group.rg_rsv_test_basic]

}
