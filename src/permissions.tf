### Role Permissions ###

# Permission descriptions: https://discord.com/developers/docs/topics/permissions#permissions-bitwise-permission-flags
# pow(2, 46) is for SEND_VOICE_MESSAGES which is not yet supported by the provider

data "discord_permission" "everyone" {
  create_instant_invite     = "deny"
  kick_members              = "deny"
  ban_members               = "deny"
  administrator             = "deny"
  manage_channels           = "deny"
  manage_guild              = "deny"
  add_reactions             = "deny"
  view_audit_log            = "deny"
  priority_speaker          = "deny"
  stream                    = "deny"
  view_channel              = "deny"
  send_messages             = "deny"
  send_tts_messages         = "deny"
  manage_messages           = "deny"
  embed_links               = "deny"
  attach_files              = "deny"
  read_message_history      = "allow"
  mention_everyone          = "deny"
  use_external_emojis       = "deny"
  view_guild_insights       = "deny"
  connect                   = "deny"
  speak                     = "deny"
  mute_members              = "deny"
  deafen_members            = "deny"
  move_members              = "deny"
  use_vad                   = "deny"
  change_nickname           = "deny"
  manage_nicknames          = "deny"
  manage_roles              = "deny"
  manage_webhooks           = "deny"
  manage_emojis             = "deny"
  use_application_commands  = "deny"
  request_to_speak          = "deny"
  manage_events             = "deny"
  manage_threads            = "deny"
  create_public_threads     = "deny"
  create_private_threads    = "deny"
  use_external_stickers     = "deny"
  send_thread_messages      = "deny"
  start_embedded_activities = "deny"
  moderate_members          = "deny"
  use_soundboard            = "deny"
  create_events             = "deny"
  use_external_sounds       = "deny"
}

data "discord_permission" "uas_alumni" {
  allow_extends             = data.discord_permission.everyone.allow_bits
  deny_extends              = data.discord_permission.everyone.deny_bits
  add_reactions             = "allow"
  stream                    = "allow"
  send_messages             = "allow"
  embed_links               = "allow"
  attach_files              = "allow"
  read_message_history      = "allow"
  use_external_emojis       = "allow"
  connect                   = "allow"
  speak                     = "allow"
  use_vad                   = "allow"
  request_to_speak          = "allow"
  create_public_threads     = "allow"
  create_private_threads    = "allow"
  use_external_stickers     = "allow"
  send_thread_messages      = "allow"
  start_embedded_activities = "allow"
  use_soundboard            = "allow"
  use_external_sounds       = "allow"
}

data "discord_permission" "verified" {
  allow_extends             = data.discord_permission.everyone.allow_bits
  deny_extends              = data.discord_permission.everyone.deny_bits
  add_reactions             = "allow"
  stream                    = "allow"
  view_channel              = "allow"
  send_messages             = "allow"
  embed_links               = "allow"
  attach_files              = "allow"
  read_message_history      = "allow"
  use_external_emojis       = "allow"
  connect                   = "allow"
  speak                     = "allow"
  use_vad                   = "allow"
  request_to_speak          = "allow"
  create_public_threads     = "allow"
  create_private_threads    = "allow"
  use_external_stickers     = "allow"
  send_thread_messages      = "allow"
  start_embedded_activities = "allow"
  use_soundboard            = "allow"
  use_external_sounds       = "allow"
}

data "discord_permission" "admin" {
  allow_extends             = data.discord_permission.verified.allow_bits + pow(2, 46)
  deny_extends              = data.discord_permission.verified.deny_bits
  mention_everyone          = "allow"
  view_guild_insights       = "allow"
  manage_emojis             = "allow"
  manage_events             = "allow"
  create_events             = "allow"
}

data "discord_permission" "sub-team_lead" {
  allow_extends             = data.discord_permission.admin.allow_bits
  deny_extends              = data.discord_permission.admin.deny_bits
  kick_members              = "allow"
  ban_members               = "allow"
  view_audit_log            = "allow"
  priority_speaker          = "allow"
  send_tts_messages         = "allow"
  manage_messages           = "allow"
  mute_members              = "allow"
  deafen_members            = "allow"
  move_members              = "allow"
  change_nickname           = "allow"
  manage_nicknames          = "allow"
  manage_threads            = "allow"
  moderate_members          = "allow"
}

### Shared Permissions ###

data "discord_permission" "no_view" {
  view_channel = "deny"
}

data "discord_permission" "yes_view" {
  view_channel = "allow"
}

data "discord_permission" "yes_slash_commands" {
  use_application_commands = "allow"
}

### Category Permissions ###

## Server Info ##

# No one can send messages in these channels by default

resource "discord_channel_permission" "server_info" {
  channel_id   = discord_category_channel.server_info.id
  type         = "role"
  overwrite_id = discord_role_everyone.everyone.id
  allow        = data.discord_permission.server_info.allow_bits
  deny         = data.discord_permission.server_info.deny_bits
}

data "discord_permission" "server_info" {
  send_messages = "deny"
}

## Admin ##

# Only admin members, sub-team leads, and captains can view this category

resource "discord_channel_permission" "admin_everyone" {
  channel_id   = discord_category_channel.admin.id
  type         = "role"
  overwrite_id = discord_role_everyone.everyone.id
  deny         = data.discord_permission.no_view.deny_bits
}

resource "discord_channel_permission" "admin_admin" {
  channel_id   = discord_category_channel.admin.id
  type         = "role"
  overwrite_id = discord_role.admin.id
  allow        = data.discord_permission.yes_view.allow_bits
}

resource "discord_channel_permission" "admin_sub-team_lead" {
  channel_id   = discord_category_channel.admin.id
  type         = "role"
  overwrite_id = discord_role.sub-team_lead.id
  allow        = data.discord_permission.yes_view.allow_bits
}

resource "discord_channel_permission" "admin_captain" {
  channel_id   = discord_category_channel.admin.id
  type         = "role"
  overwrite_id = discord_role.captain.id
  allow        = data.discord_permission.yes_view.allow_bits
}

### Channel Permissions ###

## Verify ##

# Everyone who is not yet verified can only view the #verify channel
# Sub-team leads and captains can also view the #verify channel

resource "discord_channel_permission" "verify_everyone" {
  channel_id   = discord_text_channel.verify.id
  type         = "role"
  overwrite_id = discord_role_everyone.everyone.id
  allow        = data.discord_permission.verify_everyone.allow_bits
}

resource "discord_channel_permission" "verify_verified" {
  channel_id   = discord_text_channel.verify.id
  type         = "role"
  overwrite_id = discord_role.verified.id
  deny         = data.discord_permission.no_view.deny_bits
}

resource "discord_channel_permission" "verify_sub-team_lead" {
  channel_id   = discord_text_channel.verify.id
  type         = "role"
  overwrite_id = discord_role.sub-team_lead.id
  allow        = data.discord_permission.everyone.allow_bits
}

resource "discord_channel_permission" "verify_captain" {
  channel_id   = discord_text_channel.verify.id
  type         = "role"
  overwrite_id = discord_role.captain.id
  allow        = data.discord_permission.everyone.allow_bits
}

data "discord_permission" "verify_everyone" {
  view_channel             = "allow"
  use_application_commands = "allow"
}

## Announcements ##

# Only admin members, sub-team leads, and captains can send messages in the #announcements channel

resource "discord_channel_permission" "announcements_admin" {
  channel_id   = discord_news_channel.announcements.id
  type         = "role"
  overwrite_id = discord_role.admin.id
  allow        = data.discord_permission.announcements_send.allow_bits
}

resource "discord_channel_permission" "announcements_sub-team_lead" {
  channel_id   = discord_news_channel.announcements.id
  type         = "role"
  overwrite_id = discord_role.sub-team_lead.id
  allow        = data.discord_permission.announcements_send.allow_bits
}

resource "discord_channel_permission" "announcements_captain" {
  channel_id   = discord_news_channel.announcements.id
  type         = "role"
  overwrite_id = discord_role.captain.id
  allow        = data.discord_permission.announcements_send.allow_bits
}

data "discord_permission" "announcements_send" {
  send_messages = "allow"
}

## Sub-Team Leads ##

# Only sub-team leads and captains can view the #sub-team-leads channel

resource "discord_channel_permission" "sub-team_leads_admin" {
  channel_id   = discord_text_channel.sub-team_leads.id
  type         = "role"
  overwrite_id = discord_role.admin.id
  deny         = data.discord_permission.no_view.deny_bits
}

## Sub-Team Leads Voice ##

# Only sub-team leads and captains can view the voice channel

resource "discord_channel_permission" "sub-team_leads_voice_admin" {
  channel_id   = discord_voice_channel.sub-team_leads_voice.id
  type         = "role"
  overwrite_id = discord_role.admin.id
  deny         = data.discord_permission.no_view.deny_bits
}

## Bot Commands ##

# All members can use slash commands in the #bot-commands channel

resource "discord_channel_permission" "bot_commands_everyone" {
  channel_id   = discord_text_channel.bot_commands.id
  type         = "role"
  overwrite_id = discord_role_everyone.everyone.id
  allow        = data.discord_permission.yes_slash_commands.allow_bits
}