####################################################################################################
### aws_backup_vault
####################################################################################################
variable "create_backup_vault" {
  default     = true
  description = "Determinate to create `aws_backup_vault` resources or not. "
  type        = bool
}

variable "backup_vault_name" {
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
