####################################################################################################
### aws_backup_vault
####################################################################################################
variable "create_backup_vault" {
  default     = true
  description = "Determinate to create `aws_backup_vault` resources or not. "
  type        = bool
}

variable "backup_vault_name" {
  default     = null
  description = "Required if `create_backup_vault` is set to `true`. Name of the backup vault to create"
  type        = string
}

variable "backup_vault_kms_key_arn" {
  default     = null
  description = "The server-side encryption key that is used to protect your backups"
  type        = string
}

variable "backup_vault_tags" {
  default     = null
  description = "Metadata that you can assign to help organize the resources that you create"
  type        = map(string)
}

####################################################################################################
### aws_backup_plan
####################################################################################################
variable "create_backup_plan" {
  default     = true
  description = "Determinate to create `aws_backup_vault` resources or not. "
  type        = bool
}

variable "backup_plan_name" {
  default     = null
  description = "Required if `create_backup_plan` is set to `true`. The display name of a backup plan"
  type        = string
}

variable "backup_plan_rule" {
  default     = null
  description = "Reuiqred if `create_backup_plan` is set to `true`. A rule object that specifies a scheduled task that is used to back up a selection of resources"
  type = object({
    rule_name                = string
    schedule                 = optional(string)
    enable_continuous_backup = optional(bool)
    start_window             = optional(number)
    completion_window        = optional(number)
    recovery_point_tags      = optional(map(string))
    lifecycle = optional(object({
      cold_storage_after = optional(number)
      delete_after       = optional(number)
    }))
  })
}

variable "backup_plan_advanced_backup_setting" {
  default     = null
  description = "An object that specifies backup options for each resource type"
  type = object({
    backup_options = map(string)
    resource_type  = string
  })
}

####################################################################################################
### aws_backup_selection
####################################################################################################
variable "create_backup_selection" {
  default     = true
  description = "Determinate to create `aws_backup_selection` resources or not. "
  type        = bool
}

variable "backup_selection_name" {
  default     = null
  description = "Required if `create_backup_selection` is set to `true`. The display name of a resource selection document"
  type        = string
}

variable "backup_selection_iam_role_arn" {
  default     = null
  description = "Required if `create_backup_selection` is set to `true`. The ARN of the IAM role that AWS Backup uses to authenticate when restoring and backing up the target resource"
  type        = string
}

variable "backup_selection_resources" {
  default     = null
  description = "An array of strings that either contain Amazon Resource Names (ARNs) or match patterns of resources to assign to a backup plan"
  type        = list(string)
}

variable "backup_selection_not_resources" {
  default     = null
  description = "An array of strings that either contain Amazon Resource Names (ARNs) or match patterns of resources to exclude from a backup plan"
  type        = list(string)
}
