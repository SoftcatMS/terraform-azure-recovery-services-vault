output "rsv_id" {
  description = "The id of the newly created recovery services vault"
  value       = azurerm_recovery_services_vault.rsv.id
}


output "rsv_diag_id" {
  description = "The id of the newly created recovery services vault diagnostics log"
  value       = azurerm_monitor_diagnostic_setting.rsv_diag.id
}

