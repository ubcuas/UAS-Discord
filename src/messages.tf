resource "discord_message" "image" {
  channel_id = discord_text_channel.about.id

  embed {
    color       = data.discord_color.uas_blue.dec
    image {
      url = "https://raw.githubusercontent.com/ubcuas/UAS-Discord/master/static/logo.png"
    }
  }
}

resource "discord_message" "server_info" {
  channel_id = discord_text_channel.about.id
  depends_on = [discord_message.image]

  embed {
    title       = "Server Information"
    description = <<-EOT
      Welcome to the UBC UAS Discord server!
    EOT
    color       = data.discord_color.uas_blue.dec

    fields {
      name   = "Roles"
      value  = <<-EOT
        We have a variety of roles for oranization purposes which our managed by our <@${var.uas_bot_id}>. If you have an issue with permissions please reach out to the admin team.

        - <@&${discord_role.captain.id}>: Captain
        - <@&${discord_role.sub-team_lead.id}>: Sub-team leads
        - <@&${discord_role.admin.id}>: Admin team members
        - <@&${discord_role.bots.id}>: Bots in the server
        - <@&${discord_role.aircraft.id}>: Aircraft sub-team members
        - <@&${discord_role.payload.id}>: Payload sub-team members
        - <@&${discord_role.software.id}>: Software sub-team members
        - <@&${discord_role.verified.id}>: All current members who have verified
        - <@&${discord_role.uas_alumni.id}>: Past members of the team
        - @everyone: Default role for all members (minimal permissions beyond seeing the verify channel)
      EOT
      inline = false
    }

    fields {
      name   = "Categories & Channels"
      value  = <<-EOT
        The server is structured into a few key categories with corresponding channels. The purpose of each channel should be clear by its name but you can also check its description to be sure.

        - ${discord_category_channel.server_info.name}: Information about the server and team as well as announcements
        - ${discord_category_channel.admin.name}: Private channels for admin team members
        - ${discord_category_channel.competitions.name}: Private channels for competition attendees
        - ${discord_category_channel.general.name}: General discussion and voice channels
        - ${discord_category_channel.specialized.name}: Topic-specific channels
        - Sub-Team Categories: Categories for each sub-team with their own channels
      EOT
      inline = false
    }

    fields {
      name   = "FAQ"
      value  = <<-EOT
        **How can I request and/or make server changes (e.g. new channels, roles, permission changes, etc.)?**
        - To request a change, create an issue [here](https://github.com/ubcuas/UAS-Discord/issues/new/choose) - this requires a GitHub account
        - To make a change, create a pull request on GitHub [here](https://github.com/ubcuas/UAS-Discord/)

        **Where can I find the invite link to the server?**
        - https://discord.gg/${discord_invite.main.id}
      EOT
      inline = false
    }
  }
}

resource "discord_message" "rules" {
  channel_id = discord_text_channel.about.id
  depends_on = [discord_message.server_info]

  embed {
    title       = "Rules"
    description = "UAS hopes to foster a welcoming and tight-knit community. To ensure this, all members must strictly adhere to our rules."
    color       = data.discord_color.uas_blue.dec

    fields {
      name   = "Member Agreement"
      value  = "By joining UBC UAS you agree to our [rules and guidelines](https://screenmessage.com/uas-agreement-wip)."
      inline = false
    }

    fields {
      name   = "Discord Rules"
      value  = <<-EOT
        1. Be respectful and appropriate
        Our goal is to create a tight-knit community where everyone is welcome and kind to each other. To achieve this, there will absolutely be no sexual content, homophobia, racism, transphobia, or body shaming of any of kind.

        2. No spamming of any kind
        We love to see members active in the server, but please don't spam unnecessarily. Feel free to make a thread if you want to have an in-depth discussion about a topic. The exception to this are <#${discord_text_channel.off_topic.id}> and <#${discord_text_channel.bot_commands.id}>.

        3. Keep chats in the relevant channels
        This goes without saying, but please keep chats in the relevant topic or class channels.

        4. Discord's TOS and Community Guidelines
        You must abide by the rules noted in Discord's [Terms of Service](https://discord.com/terms) and [Community Guidelines](https://discord.com/guidelines).
      EOT
      inline = false
    }

    fields {
      name   = "Report an Issue"
      value  = <<-EOT
        We work hard to make the UAS community a safe place for everyone but acknowledge that this isn't always possible. If you have an issue with anyone at any time and don't feel comfortable talking to them directly, please reach out to either the captain or one of the leads (whoever you feel most comfortable talking to).
      EOT
      inline = false
    }
  }
}

resource "discord_message" "resources" {
  channel_id = discord_text_channel.about.id
  depends_on = [discord_message.rules]

  embed {
    title       = "Team Resources"
    description = <<-EOT
      UAS operates on a variety of platforms to take advantage of the best tools for each task. To find all of these tools and resources please visit the [Confluence home page](https://ubcuas.atlassian.net/wiki).
    EOT
    color       = data.discord_color.uas_blue.dec
  }
}