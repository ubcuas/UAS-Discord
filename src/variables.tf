variable "terraform_bot_token" {
  type        = string
  description = "The token for the Terraform Discord bot"
  sensitive   = true
}

variable "terraform_bot_id" {
  type        = string
  description = "The ID of the Terraform Discord bot"
  sensitive   = true
}

variable "uas_bot_id" {
  type        = string
  description = "The ID of the UAS Discord bot"
  sensitive   = true
}

variable "server_id" {
  type        = string
  description = "The ID of the UAS Discord server"
  sensitive   = true
}

variable "uas_account_id" {
  type        = string
  description = "The ID of the UAS admin Discord account"
  sensitive   = true
}

variable "github_token" {
  type        = string
  description = "The token for the GitHub provider"
  sensitive   = true
}