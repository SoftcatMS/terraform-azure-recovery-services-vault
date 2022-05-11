resource "azurerm_resource_group" "rg_rsv_example" {
  name     = "UKS-RSG-SOFTCAT-MANAGEMENT"
  location = "uksouth"
}


module "example_rsv" {
  source                                 = "../../"
  name                                   = "rsv-uks-example"
  location                               = "uksouth"
  resource_group_name                    = "UKS-RSG-SOFTCAT-MANAGEMENT"
  log_analytics_workspace                = "UKS-LOG-SOFTCAT-MANAGEMENT"
  log_analytics_workspace_resource_group = "UKS-RSG-SOFTCAT-MANAGEMENT"
  storage_mode_type                      = "GeoRedundant"
  cross_region_restore_enabled           = false
  soft_delete_enabled                    = false
  sku                                    = "Standard"

  depends_on = [azurerm_resource_group.rg_rsv_example]

}
