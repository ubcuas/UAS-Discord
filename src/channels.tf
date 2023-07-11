# Verify Channel
resource "discord_text_channel" "verify" {
  name                     = "verify"
  server_id                = var.server_id
  position                 = 0
  topic                    = "Verify your identity to gain access to the server"
}

## Server Info Category ##

resource "discord_text_channel" "about" {
  name                     = "about"
  server_id                = var.server_id
  position                 = 0
  topic                    = "General information about the UBC UAS Discord server"
  category                 = discord_category_channel.server_info.id
  sync_perms_with_category = true
}

resource "discord_news_channel" "announcements" {
  name                    = "announcements"
  server_id               = var.server_id
  position                = 1
  topic                   = "Announcements regarding the whole team"
  category                = discord_category_channel.server_info.id
  sync_perms_with_category = false
}

## Admin Category ##

resource "discord_text_channel" "sub-team_leads" {
  name                     = "sub-team-leads"
  server_id                = var.server_id
  position                 = 0
  topic                    = "Discussion between sub-team leads"
  category                 = discord_category_channel.admin.id
  sync_perms_with_category = false
}

resource "discord_text_channel" "admin_general" {
  name                     = "general"
  server_id                = var.server_id
  position                 = 1
  topic                    = "General admin discussion"
  category                 = discord_category_channel.admin.id
  sync_perms_with_category = true
}

resource "discord_text_channel" "admin_trello" {
  name                     = "trello"
  server_id                = var.server_id
  position                 = 2
  topic                    = "Trello notifications for the admin team"
  category                 = discord_category_channel.admin.id
  sync_perms_with_category = true
}

resource "discord_voice_channel" "admin_voice" {
  name                     = "Admin Voice"
  server_id                = var.server_id
  position                 = 0
  category                 = discord_category_channel.admin.id
  sync_perms_with_category = true
}

resource "discord_voice_channel" "sub-team_leads_voice" {
  name                     = "Sub-team Leads"
  server_id                = var.server_id
  position                 = 1
  category                 = discord_category_channel.admin.id
  sync_perms_with_category = false
}

## General Category ##

resource "discord_text_channel" "uas_family" {
  name                     = "uas-family"
  server_id                = var.server_id
  position                 = 0
  topic                    = "General discussion about the UBC UAS team"
  category                 = discord_category_channel.general.id
  sync_perms_with_category = true
}

resource "discord_text_channel" "off_topic" {
  name                     = "off-topic"
  server_id                = var.server_id
  position                 = 1
  topic                    = "Anything off-topic"
  category                 = discord_category_channel.general.id
  sync_perms_with_category = true
}

resource "discord_text_channel" "bot_commands" {
  name                     = "bot-commands"
  server_id                = var.server_id
  position                 = 2
  topic                    = "The place to send bot commands"
  category                 = discord_category_channel.general.id
  sync_perms_with_category = false
}

resource "discord_voice_channel" "music" {
  name                     = "Music"
  server_id                = var.server_id
  position                 = 0
  category                 = discord_category_channel.general.id
  sync_perms_with_category = true
}

resource "discord_voice_channel" "general" {
  name                     = "General"
  server_id                = var.server_id
  position                 = 1
  category                 = discord_category_channel.general.id
  sync_perms_with_category = true
}