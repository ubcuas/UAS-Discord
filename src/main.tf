resource "discord_managed_server" "uas_server" {
  server_id                     = var.server_id
  name                          = "UBC UAS"
  region                        = "us-west" # For voice channels
  verification_level            = 1 # Low
  explicit_content_filter       = 2 # Filter for all members
  default_message_notifications = 0 # All messages
  owner_id                      = var.uas_account_id
  splash_data_uri               = data.discord_local_image.icon.data_uri # Splash = icon
  afk_channel_id                = discord_voice_channel.music.id
  afk_timeout                   = 900 # 15 Minutes
}

resource "discord_system_channel" "system" {
  server_id         = var.server_id
  system_channel_id = discord_text_channel.uas_family.id
}

data "discord_local_image" "icon" {
  file = "../static/discord-icon.png"
}

resource "discord_invite" "main" {
  channel_id = discord_text_channel.verify.id
  max_age    = 0
  unique     = false
}