resource "discord_role_everyone" "everyone" {
  server_id   = var.server_id
  permissions = data.discord_permission.everyone.allow_bits
}

# Past UAS members we want to keep in the server
resource "discord_role" "uas_alumni" {
  server_id   = var.server_id
  name        = "UAS Alumni"
  permissions = data.discord_permission.uas_alumni.allow_bits + pow(2, 46)
  color       = data.discord_color.white.dec
  hoist       = false
  mentionable = false
  position    = 1
}

# All members who have verified their identity
resource "discord_role" "verified" {
  server_id   = var.server_id
  name        = "Verified"
  permissions = data.discord_permission.verified.allow_bits + pow(2, 46)
  color       = data.discord_color.uas_blue.dec
  hoist       = false
  mentionable = false
  position    = 2
}

# Members attending the SUAS competition
resource "discord_role" "suas" {
  server_id   = var.server_id
  name        = "SUAS"
  hoist       = false
  mentionable = true
  position    = 3 
}

# Members attending the AEAC competition
resource "discord_role" "aeac" {
  server_id   = var.server_id
  name        = "AEAC"
  hoist       = false
  mentionable = true
  position    = 4
}

resource "discord_role" "payload" {
  server_id   = var.server_id
  name        = "Payload"
  color       = data.discord_color.payload.dec
  hoist       = true
  mentionable = true
  position    = 5
}

resource "discord_role" "software" {
  server_id   = var.server_id
  name        = "Software"
  color       = data.discord_color.software.dec
  hoist       = true
  mentionable = true
  position    = 6
}

resource "discord_role" "aircraft" {
  server_id   = var.server_id
  name        = "Aircraft"
  color       = data.discord_color.aircraft.dec
  hoist       = true
  mentionable = true
  position    = 7
}

resource "discord_role" "admin" {
  server_id   = var.server_id
  name        = "Admin"
  permissions = data.discord_permission.admin.allow_bits
  color       = data.discord_color.admin.dec
  hoist       = false
  mentionable = true
  position    = 8
}

resource "discord_role" "sub-team_lead" {
  server_id   = var.server_id
  name        = "Sub-Team Lead"
  permissions = data.discord_permission.sub-team_lead.allow_bits
  color       = data.discord_color.sub-team_lead.dec
  hoist       = false
  mentionable = true
  position    = 9
}

resource "discord_role" "captain" {
  server_id   = var.server_id
  name        = "Captain"
  permissions = data.discord_permission.sub-team_lead.allow_bits
  color       = data.discord_color.captain.dec
  hoist       = true
  mentionable = true
  position    = 10
}