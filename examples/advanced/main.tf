resource "azurerm_resource_group" "rg_rsv_example" {
  name     = "UKS-RSG-SOFTCAT-MANAGEMENT"
  location = "uksouth"
}


module "example_rsv" {
  source                                 = "github.com/SoftcatMS/terraform-azure-recovery-services-vault"
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
