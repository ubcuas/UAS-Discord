resource "discord_message" "about" {
    channel_id = discord_text_channel.about.id
    embed {
        title = "UBC UAS Discord Server"
        description = <<-EOT
            Welcome to the UBC UAS Discord server!
        EOT
        color = data.discord_color.uas_blue.dec

        fields {
            name = "Roles"
            value = "..."
            inline = false
        }

        fields {
            name = "Channels"
            value = "..."
            inline = false
        }

        fields {
            name = "Rules"
            value = "..."
            inline = false
        }

        fields {
            name = "FAQ"
            value = "..."
            inline = false
        }
    }
}