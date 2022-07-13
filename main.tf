resource "aws_backup_vault" "backup_vault" {
  count = var.create_backup_vault ? 1 : 0

  name        = var.backup_vault_name
  kms_key_arn = var.backup_vault_kms_key_arn
  tags        = var.backup_vault_tags
}
