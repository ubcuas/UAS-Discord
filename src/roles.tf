# UAS Bot holds the highest role in the server
# Server Booster is the lowest role above @everyone

resource "discord_role_everyone" "everyone" {
  server_id   = var.server_id
  permissions = data.discord_permission.everyone.allow_bits
}

resource "discord_role" "captain" {
  server_id   = var.server_id
  name        = "Captain"
  permissions = data.discord_permission.sub-team_lead.allow_bits
  color       = data.discord_color.captain.dec
  hoist       = true
  mentionable = true
  position    = 15
}

resource "discord_role" "sub-team_lead" {
  server_id   = var.server_id
  name        = "Sub-Team Lead"
  permissions = data.discord_permission.sub-team_lead.allow_bits
  color       = data.discord_color.sub-team_lead.dec
  hoist       = false
  mentionable = true
  position    = 14

  depends_on = [ discord_role.captain ]
}

resource "discord_role" "admin" {
  server_id   = var.server_id
  name        = "Admin"
  permissions = data.discord_permission.admin.allow_bits
  color       = data.discord_color.admin.dec
  hoist       = false
  mentionable = true
  position    = 13

  depends_on = [ discord_role.sub-team_lead ]
}

resource "discord_role" "bots" {
  server_id   = var.server_id
  name        = "Bots"
  permissions = 0
  color       = data.discord_color.white.dec
  hoist       = true
  mentionable = false
  position    = 12

  depends_on = [ discord_role.admin ]
}

resource "discord_role" "aircraft" {
  server_id   = var.server_id
  name        = "Aircraft"
  permissions = 0
  color       = data.discord_color.aircraft.dec
  hoist       = true
  mentionable = true
  position    = 11

  depends_on = [ discord_role.bots ]
}

resource "discord_role" "payload" {
  server_id   = var.server_id
  name        = "Payload"
  permissions = 0
  color       = data.discord_color.payload.dec
  hoist       = true
  mentionable = true
  position    = 10

  depends_on = [ discord_role.aircraft ]
}

resource "discord_role" "software" {
  server_id   = var.server_id
  name        = "Software"
  permissions = 0
  color       = data.discord_color.software.dec
  hoist       = true
  mentionable = true
  position    = 9

  depends_on = [ discord_role.payload ]
}

# Advisors to current leads (most likely last year's leads)
resource "discord_role" "lead_advisor" {
  server_id   = var.server_id
  name        = "Lead Advisor"
  permissions = 0
  color       = data.discord_color.white.dec
  hoist       = false
  mentionable = true
  position    = 8

  depends_on = [ discord_role.software ]
}

# All members who have verified their identity
resource "discord_role" "verified" {
  server_id   = var.server_id
  name        = "Verified"
  permissions = data.discord_permission.verified.allow_bits + pow(2, 46)
  color       = data.discord_color.uas_blue.dec
  hoist       = false
  mentionable = false
  position    = 7

  depends_on = [ discord_role.lead_advisor ]
}

# Past UAS members we want to keep in the server
resource "discord_role" "uas_alumni" {
  server_id   = var.server_id
  name        = "UAS Alumni"
  permissions = data.discord_permission.uas_alumni.allow_bits + pow(2, 46)
  color       = data.discord_color.white.dec
  hoist       = false
  mentionable = false
  position    = 6

  depends_on = [ discord_role.verified ]
}

# Members attending the SUAS competition
resource "discord_role" "suas" {
  server_id   = var.server_id
  name        = "SUAS"
  permissions = 0
  hoist       = false
  mentionable = true
  position    = 5

  depends_on = [ discord_role.uas_alumni ]
}

# Members attending the AEAC competition
resource "discord_role" "aeac" {
  server_id   = var.server_id
  name        = "AEAC"
  permissions = 0
  hoist       = false
  mentionable = true
  position    = 4

  depends_on = [ discord_role.suas ]
}

# Members receiving RPAS flight training & certification
resource "discord_role" "rpas" {
  server_id   = var.server_id
  name        = "RPAS"
  permissions = 0
  hoist       = false
  mentionable = true
  position    = 3

  depends_on = [ discord_role.aeac ]
}