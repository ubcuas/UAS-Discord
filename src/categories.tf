resource "discord_category_channel" "server_info" {
  name      = "Server Info"
  server_id = var.server_id
  position  = 0
}

resource "discord_category_channel" "admin" {
  name      = "Admin Channels"
  server_id = var.server_id
  position  = 1
}

resource "discord_category_channel" "competitions" {
  name      = "Competition Channels"
  server_id = var.server_id
  position  = 2
}

resource "discord_category_channel" "general" {
  name      = "General Channels"
  server_id = var.server_id
  position  = 3
}

resource "discord_category_channel" "specialized" {
  name      = "Specialized Channels"
  server_id = var.server_id
  position  = 4
}

resource "discord_category_channel" "aircraft" {
  name      = "Aircraft Sub-Team"
  server_id = var.server_id
  position  = 5
}

resource "discord_category_channel" "software" {
  name      = "Software Sub-Team"
  server_id = var.server_id
  position  = 6
}

resource "discord_category_channel" "payload" {
  name      = "Payload Sub-Team"
  server_id = var.server_id
  position  = 7
}