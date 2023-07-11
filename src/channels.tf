## Server Info Category ##

resource discord_text_channel about {
  name                     = "about"
  server_id                = var.server_id
  position                 = 0
  topic                    = "General information about the UBC UAS Discord server"
  category                 = discord_category_channel.server_info.id
  sync_perms_with_category = true
}

## General Category ##