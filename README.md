# terraform-azure-recovery-services-vault

Deploys a Recovery Services Vault and Backup Policy for VMs


It supports creating:

- Recovery Services Vault (azurerm_recovery_services_vault)
- Backup Policies


## Usage Examples
You can go to the tests folder, or review the examples folder: [examples](./examples)


## Deployment
Perform the following commands on the root folder:

- `terraform init` to get the plugins
- `terraform plan` to see the infrastructure plan
- `terraform apply` to apply the infrastructure build
- `terraform destroy` to destroy the built infrastructure



< use terraform-docs to create Inputs and Outpus documentation >  [terraform-docs](https://github.com/terraform-docs/terraform-docs)

`terraform-docs markdown .`


## Requirements
### Installed Software
The following dependencies must be installed on the development system:

- [Terraform](https://www.terraform.io/downloads.html) 

Azure  
- [Terraform Provider for Azure](https://github.com/hashicorp/terraform-provider-azurerm)
- CLI Tool [az](https://docs.microsoft.com/en-us/cli/azure/)

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_backup_policy_vm.backup_policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/backup_policy_vm) | resource |
| [azurerm_monitor_diagnostic_setting.rsv_diag](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_recovery_services_vault.rsv](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/recovery_services_vault) | resource |
| [azurerm_log_analytics_workspace.rsv_workspace](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/log_analytics_workspace) | data source |
| [azurerm_resource_group.rsv](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_backup_policies_vm"></a> [backup\_policies\_vm](#input\_backup\_policies\_vm) | Define vm backup Policy | <pre>map(object({<br>    name      = string<br>    frequency = string<br>    timezone  = string<br>    time      = string<br>    count     = number<br>    weekdays  = list(string)<br>  }))</pre> | `{}` | no |
| <a name="input_cross_region_restore_enabled"></a> [cross\_region\_restore\_enabled](#input\_cross\_region\_restore\_enabled) | Is cross region restore enabled for this Vault? | `bool` | `false` | no |
| <a name="input_location"></a> [location](#input\_location) | Azure location for Key Vault. | `string` | n/a | yes |
| <a name="input_log_analytics_workspace"></a> [log\_analytics\_workspace](#input\_log\_analytics\_workspace) | Name of the Log Analytics Workspace. | `string` | `"UKS-LOG-SOFTCAT-MANAGEMENT"` | no |
| <a name="input_log_analytics_workspace_resource_group"></a> [log\_analytics\_workspace\_resource\_group](#input\_log\_analytics\_workspace\_resource\_group) | Name of the Log Analytics Workspace resource group. | `string` | `"UKS-RSG-SOFTCAT-MANAGEMENT"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the MySQL Server. Changing this forces a new resource to be created | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the application ressource group, herited from infra module | `string` | n/a | yes |
| <a name="input_sku"></a> [sku](#input\_sku) | Sets the vault's SKU. Possible values include: Standard, RS0. | `string` | `"Standard"` | no |
| <a name="input_soft_delete_enabled"></a> [soft\_delete\_enabled](#input\_soft\_delete\_enabled) | Is soft delete enable for this Vault? Defaults | `bool` | `true` | no |
| <a name="input_storage_mode_type"></a> [storage\_mode\_type](#input\_storage\_mode\_type) | The storage type of the Recovery Services Vault. | `string` | `"GeoRedundant"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to all resources created. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_rsv_diag_id"></a> [rsv\_diag\_id](#output\_rsv\_diag\_id) | The id of the newly created recovery services vault diagnostics log |
| <a name="output_rsv_id"></a> [rsv\_id](#output\_rsv\_id) | The id of the newly created recovery services vault |


## Contributing

Refer to the [contribution guidelines](./CONTRIBUTING.md) for
information on contributing to this module.
