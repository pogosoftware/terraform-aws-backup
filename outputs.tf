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

####################################################################################################
### aws_backup_plan
####################################################################################################
output "backup_plan_id" {
  description = "The id of the backup plan"
  value       = try(aws_backup_plan.backup_plan[0].id, "")
}

output "backup_plan_arn" {
  description = "The ARN of the backup plan"
  value       = try(aws_backup_plan.backup_plan[0].arn, "")
}

####################################################################################################
### aws_backup_selection
####################################################################################################
output "backup_selection_id" {
  description = "The id of the backup plan"
  value       = try(aws_backup_selection.backup_selection[0].id, "")
}
