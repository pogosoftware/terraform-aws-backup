####################################################################################################
### aws_backup_vault
####################################################################################################
output "backup_vault_id" {
  description = "The name of the vault"
  value       = try(aws_backup_vault.backup_vault[0].id, "")
}

output "backup_vault_arn" {
  description = "The ARN of the vault"
  value       = try(aws_backup_vault.backup_vault[0].arn, "")
}

output "backup_vault_recovery_points" {
  description = "The number of recovery points that are stored in a backup vault"
  value       = try(aws_backup_vault.backup_vault[0].recovery_points, "")
}
