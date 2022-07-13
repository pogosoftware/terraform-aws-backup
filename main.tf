resource "aws_backup_vault" "backup_vault" {
  count = var.create_backup_vault ? 1 : 0

  name        = var.backup_vault_name
  kms_key_arn = var.backup_vault_kms_key_arn
  tags        = var.backup_vault_tags
}

resource "aws_backup_plan" "backup_plan" {
  count = var.create_backup_plan ? 1 : 0

  name = var.backup_plan_name

  dynamic "rule" {
    for_each = var.backup_plan_rule != null ? [var.backup_plan_rule] : []

    content {
      rule_name                = rule.value["rule_name"]
      target_vault_name        = aws_backup_vault.backup_vault[0].name
      schedule                 = try(rule.value["schedule"], null)
      enable_continuous_backup = try(rule.value["enable_continuous_backup"], null)
      start_window             = try(rule.value["start_window"], null)
      completion_window        = try(rule.value["completion_window"], null)
      recovery_point_tags      = try(rule.value["recovery_point_tags"], null)

      dynamic "lifecycle" {
        for_each = try([rule.value["lifecycle"]], [])

        content {
          cold_storage_after = lookup(lifecycle.value, "cold_storage_after", null)
          delete_after       = lookup(lifecycle.value, "delete_after", null)
        }
      }
    }
  }

  dynamic "advanced_backup_setting" {
    for_each = var.backup_plan_advanced_backup_setting != null ? [var.backup_plan_advanced_backup_setting] : []

    content {
      backup_options = each.value.backup_options
      resource_type  = each.value.resource_type
    }
  }
}
