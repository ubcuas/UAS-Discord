variable "discord_token" {
    type        = string
    description = "The token for the Discord bot"
    sensitive   = true
}

variable "server_id" {
    type        = string
    description = "The ID of the Discord server"
    sensitive   = true
}

variable "uas_account_id" {
    type        = string
    description = "The ID of the UAS Discord account"
    sensitive   = true
}