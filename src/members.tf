resource "discord_member_roles" "uas_bot" {
  user_id   = var.uas_bot_id
  server_id = var.server_id

  role {
    role_id  = discord_role.bots.id
    has_role = true
  }
}