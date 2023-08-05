# Verify Channel
resource "discord_text_channel" "verify" {
  name                     = "verify"
  server_id                = var.server_id
  position                 = 0
  topic                    = "Verify your identity to gain access to the server"
  sync_perms_with_category = false
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

resource "discord_text_channel" "announcements" {
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

resource "discord_text_channel" "server_messages" {
  name                     = "server-messages"
  server_id                = var.server_id
  position                 = 3
  topic                    = "Automated Discord messages"
  category                 = discord_category_channel.admin.id
  sync_perms_with_category = false
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

## Competition Category ##

resource "discord_text_channel" "aeac" {
  name                     = "aeac"
  server_id                = var.server_id
  position                 = 0
  topic                    = "Private channel for the AEAC attendees"
  category                 = discord_category_channel.competitions.id
  sync_perms_with_category = false
}

resource "discord_text_channel" "suas" {
  name                     = "suas"
  server_id                = var.server_id
  position                 = 1
  topic                    = "Private channel for the SUAS attendees"
  category                 = discord_category_channel.competitions.id
  sync_perms_with_category = false
}

resource "discord_voice_channel" "aeac" {
  name                     = "AEAC"
  server_id                = var.server_id
  position                 = 0
  category                 = discord_category_channel.competitions.id
  sync_perms_with_category = false
}

resource "discord_voice_channel" "suas" {
  name                     = "SUAS"
  server_id                = var.server_id
  position                 = 1
  category                 = discord_category_channel.competitions.id
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

## Specialized Category ##

resource "discord_text_channel" "marketing" {
  name                     = "marketing"
  server_id                = var.server_id
  position                 = 0
  topic                    = "UAS Social media and marketing"
  category                 = discord_category_channel.specialized.id
  sync_perms_with_category = true
}

resource "discord_text_channel" "socials" {
  name                     = "socials"
  server_id                = var.server_id
  position                 = 1
  topic                    = "To coordinate and plan social events for the team"
  category                 = discord_category_channel.specialized.id
  sync_perms_with_category = true
}

resource "discord_text_channel" "random_industry_intel" {
  name                     = "random-industry-intel"
  server_id                = var.server_id
  position                 = 2
  topic                    = "Got any news, announcements, sexy aircraft pictures? Share them here!"
  category                 = discord_category_channel.specialized.id
  sync_perms_with_category = true
}

resource "discord_text_channel" "purchasing" {
  name                     = "purchasing"
  server_id                = var.server_id
  position                 = 3
  topic                    = "Discussion about purchasing requests and decisions"
  category                 = discord_category_channel.specialized.id
  sync_perms_with_category = true
}

resource "discord_text_channel" "rapid_prototyping" {
  name                     = "rapid-prototyping"
  server_id                = var.server_id
  position                 = 4
  topic                    = "For rapid prototyping requests and accomplishments"
  category                 = discord_category_channel.specialized.id
  sync_perms_with_category = true
}

resource "discord_text_channel" "flight_club" {
  name                     = "flight-club"
  server_id                = var.server_id
  position                 = 5
  topic                    = "To organize drone flying and practice sessions. No flight experience required!"
  category                 = discord_category_channel.specialized.id
  sync_perms_with_category = true
}

resource "discord_text_channel" "rpas_licensing" {
  name                     = "rpas-licensing"
  server_id                = var.server_id
  position                 = 6
  topic                    = "Let's go be legal pilots!"
  category                 = discord_category_channel.specialized.id
  sync_perms_with_category = true
}

## Aircraft Category ##

resource "discord_text_channel" "aircraft_general" {
  name                     = "general"
  server_id                = var.server_id
  position                 = 0
  topic                    = "Home of the aircraft sub-team"
  category                 = discord_category_channel.aircraft.id
  sync_perms_with_category = true
}

## Payload Category ##

resource "discord_text_channel" "payload_general" {
  name                     = "general"
  server_id                = var.server_id
  position                 = 0
  topic                    = "Home of the payload sub-team"
  category                 = discord_category_channel.payload.id
  sync_perms_with_category = true
}

## Software Category ##

resource "discord_text_channel" "software_general" {
  name                     = "general"
  server_id                = var.server_id
  position                 = 0
  topic                    = "Home of the software sub-team"
  category                 = discord_category_channel.software.id
  sync_perms_with_category = true
}

resource "discord_text_channel" "software_reviews" {
  name                     = "reviews"
  server_id                = var.server_id
  position                 = 1
  topic                    = "Software pull requests and reviews"
  category                 = discord_category_channel.software.id
  sync_perms_with_category = true
}

resource "discord_text_channel" "software_errors" {
  name                     = "errors"
  server_id                = var.server_id
  position                 = 2
  topic                    = "Software error reports"
  category                 = discord_category_channel.software.id
  sync_perms_with_category = true
}