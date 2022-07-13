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
| [aws_backup_vault.backup_vault](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/backup_vault) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_backup_vault_kms_key_arn"></a> [backup\_vault\_kms\_key\_arn](#input\_backup\_vault\_kms\_key\_arn) | The server-side encryption key that is used to protect your backups | `string` | `null` | no |
| <a name="input_backup_vault_name"></a> [backup\_vault\_name](#input\_backup\_vault\_name) | Required if `create_backup_vault` is set to `true`. Name of the backup vault to create | `string` | n/a | yes |
| <a name="input_backup_vault_tags"></a> [backup\_vault\_tags](#input\_backup\_vault\_tags) | Metadata that you can assign to help organize the resources that you create | `map(string)` | `null` | no |
| <a name="input_create_backup_vault"></a> [create\_backup\_vault](#input\_create\_backup\_vault) | Determinate to create `aws_backup_vault` resources or not. | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_backup_vault_arn"></a> [backup\_vault\_arn](#output\_backup\_vault\_arn) | The ARN of the vault |
| <a name="output_backup_vault_id"></a> [backup\_vault\_id](#output\_backup\_vault\_id) | The name of the vault |
| <a name="output_backup_vault_recovery_points"></a> [backup\_vault\_recovery\_points](#output\_backup\_vault\_recovery\_points) | The number of recovery points that are stored in a backup vault |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->