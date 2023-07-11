resource discord_managed_server uas_server {
    server_id                     = var.server_id
    name                          = "UBC UAS Test"
    region                        = "us-west"
    verification_level            = 1 # Low
    explicit_content_filter       = 2 # Filter for all members
    default_message_notifications = 0 # All messages
    owner_id                      = var.uas_account_id
    icon_url                      = "https://drive.google.com/file/d/1uOp7KQ9e8avwsj6meVWMIfr1K9lxHFon/view"
    # afk_channel_id                =
    # af_timeout                    = 30 # Minutes
    # system_channel_id             = 
}

resource discord_invite main {
    channel_id = discord_text_channel.about.id
    max_age    = 0
    unique     = false
}