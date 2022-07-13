# terraform-aws-backup

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.22 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.22.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_backup_plan.backup_plan](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/backup_plan) | resource |
| [aws_backup_selection.backup_selection](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/backup_selection) | resource |
| [aws_backup_vault.backup_vault](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/backup_vault) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_backup_plan_advanced_backup_setting"></a> [backup\_plan\_advanced\_backup\_setting](#input\_backup\_plan\_advanced\_backup\_setting) | An object that specifies backup options for each resource type | <pre>object({<br>    backup_options = map(string)<br>    resource_type  = string<br>  })</pre> | `null` | no |
| <a name="input_backup_plan_name"></a> [backup\_plan\_name](#input\_backup\_plan\_name) | Required if `create_backup_plan` is set to `true`. The display name of a backup plan | `string` | `null` | no |
| <a name="input_backup_plan_rule"></a> [backup\_plan\_rule](#input\_backup\_plan\_rule) | Reuiqred if `create_backup_plan` is set to `true`. A rule object that specifies a scheduled task that is used to back up a selection of resources | <pre>object({<br>    rule_name                = string<br>    schedule                 = optional(string)<br>    enable_continuous_backup = optional(bool)<br>    start_window             = optional(number)<br>    completion_window        = optional(number)<br>    recovery_point_tags      = optional(map(string))<br>    lifecycle = optional(object({<br>      cold_storage_after = optional(number)<br>      delete_after       = optional(number)<br>    }))<br>  })</pre> | `null` | no |
| <a name="input_backup_selection_iam_role_arn"></a> [backup\_selection\_iam\_role\_arn](#input\_backup\_selection\_iam\_role\_arn) | Required if `create_backup_selection` is set to `true`. The ARN of the IAM role that AWS Backup uses to authenticate when restoring and backing up the target resource | `string` | `null` | no |
| <a name="input_backup_selection_name"></a> [backup\_selection\_name](#input\_backup\_selection\_name) | Required if `create_backup_selection` is set to `true`. The display name of a resource selection document | `string` | `null` | no |
| <a name="input_backup_selection_not_resources"></a> [backup\_selection\_not\_resources](#input\_backup\_selection\_not\_resources) | An array of strings that either contain Amazon Resource Names (ARNs) or match patterns of resources to exclude from a backup plan | `list(string)` | `null` | no |
| <a name="input_backup_selection_resources"></a> [backup\_selection\_resources](#input\_backup\_selection\_resources) | An array of strings that either contain Amazon Resource Names (ARNs) or match patterns of resources to assign to a backup plan | `list(string)` | `null` | no |
| <a name="input_backup_vault_kms_key_arn"></a> [backup\_vault\_kms\_key\_arn](#input\_backup\_vault\_kms\_key\_arn) | The server-side encryption key that is used to protect your backups | `string` | `null` | no |
| <a name="input_backup_vault_name"></a> [backup\_vault\_name](#input\_backup\_vault\_name) | Required if `create_backup_vault` is set to `true`. Name of the backup vault to create | `string` | `null` | no |
| <a name="input_backup_vault_tags"></a> [backup\_vault\_tags](#input\_backup\_vault\_tags) | Metadata that you can assign to help organize the resources that you create | `map(string)` | `null` | no |
| <a name="input_create_backup_plan"></a> [create\_backup\_plan](#input\_create\_backup\_plan) | Determinate to create `aws_backup_vault` resources or not. | `bool` | `true` | no |
| <a name="input_create_backup_selection"></a> [create\_backup\_selection](#input\_create\_backup\_selection) | Determinate to create `aws_backup_selection` resources or not. | `bool` | `true` | no |
| <a name="input_create_backup_vault"></a> [create\_backup\_vault](#input\_create\_backup\_vault) | Determinate to create `aws_backup_vault` resources or not. | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_backup_plan_arn"></a> [backup\_plan\_arn](#output\_backup\_plan\_arn) | The ARN of the backup plan |
| <a name="output_backup_plan_id"></a> [backup\_plan\_id](#output\_backup\_plan\_id) | The id of the backup plan |
| <a name="output_backup_selection_id"></a> [backup\_selection\_id](#output\_backup\_selection\_id) | The id of the backup plan |
| <a name="output_backup_vault_arn"></a> [backup\_vault\_arn](#output\_backup\_vault\_arn) | The ARN of the vault |
| <a name="output_backup_vault_id"></a> [backup\_vault\_id](#output\_backup\_vault\_id) | The name of the vault |
| <a name="output_backup_vault_recovery_points"></a> [backup\_vault\_recovery\_points](#output\_backup\_vault\_recovery\_points) | The number of recovery points that are stored in a backup vault |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->