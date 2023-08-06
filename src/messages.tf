### Verify Channel ###

resource "discord_message" "verify_image" {
  channel_id = discord_text_channel.verify.id

  embed {
    color = data.discord_color.uas_blue.dec
    image {
      height = 996
      width  = 3840
      url    = "https://raw.githubusercontent.com/ubcuas/UAS-Discord/master/static/logo.png"
    }
  }
}

resource "discord_message" "verify" {
  channel_id = discord_text_channel.verify.id
  depends_on = [discord_message.verify_image]

  embed {
    title       = "Verification"
    color       = data.discord_color.uas_blue.dec
    description = chomp(
      <<-EOT
        Welcome to the UBC UAS Discord server! To gain full access to the server, use the `/verify` command in this channel.
      EOT
    )

    fields {
      name   = "Help"
      inline = false
      value  = chomp(
        <<-EOT
          If you have any issues with or questions about the verification process, please use the `/help` command.
        EOT
      )
    }
  }
}

### About Channel ###

resource "discord_message" "image" {
  channel_id = discord_text_channel.about.id

  embed {
    color = data.discord_color.uas_blue.dec
    image {
      height = 996
      width  = 3840
      url    = "https://raw.githubusercontent.com/ubcuas/UAS-Discord/master/static/logo.png"
    }
  }
}

resource "discord_message" "server_info" {
  channel_id = discord_text_channel.about.id
  depends_on = [discord_message.image]

  embed {
    title       = "Server Information"
    color       = data.discord_color.uas_blue.dec
    description = chomp(
      <<-EOT
        Welcome to the UBC UAS Discord server!
      EOT
    )

    fields {
      name   = "Roles"
      inline = false
      value  = chomp(
        replace(
          <<-EOT
            We have a variety of roles for oranization purposes which our managed by the <@${var.uas_bot_id}>. If you have an issue with permissions please reach out to the admin team.
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
        , "\r\n", "\n")
      )
    }

    fields {
      name   = "Categories & Channels"
      inline = false
      value  = chomp(
        replace(
            <<-EOT
                The server is structured into a few key categories with corresponding channels. The purpose of each channel should be clear by its name but you can also check its description to be sure.
                - ${discord_category_channel.server_info.name}: Information about the server and team as well as announcements
                - ${discord_category_channel.admin.name}: Private channels for admin team members
                - ${discord_category_channel.competitions.name}: Private channels for competition attendees
                - ${discord_category_channel.general.name}: General discussion and voice channels
                - ${discord_category_channel.specialized.name}: Topic-specific channels
                - Sub-Team Categories: Categories for each sub-team with their own channels
            EOT
        , "\r\n", "\n")
      )
    }

    fields {
      name   = "FAQ"
      inline = false
      value  = chomp(
        replace(
          <<-EOT
            How can I request and/or make server changes (e.g. new channels, roles, permission changes, etc.)?
            - To request a change, create an issue [here](https://github.com/ubcuas/UAS-Discord/issues/new/choose) - this requires a GitHub account
            - To make a change, create a pull request on GitHub [here](https://github.com/ubcuas/UAS-Discord/)

            Where can I find the invite link to the server?
            - https://discord.gg/${discord_invite.main.id}
          EOT
        , "\r\n", "\n")
      )
    }
  }
}

resource "discord_message" "rules" {
  channel_id = discord_text_channel.about.id
  depends_on = [discord_message.server_info]

  embed {
    title       = "Rules"
    color       = data.discord_color.uas_blue.dec
    description = chomp(
      <<-EOT
        UAS hopes to foster a welcoming and tight-knit community. To ensure this, all members must strictly adhere to our rules.
      EOT
    )

    fields {
      name   = "Member Agreement"
      inline = false
      value  = chomp(
        <<-EOT
          By joining UBC UAS you agree to our [rules and guidelines](https://screenmessage.com/uas-agreement-wip).
        EOT
      )
    }

    fields {
      name   = "Discord Rules"
      inline = false
      value  = chomp(
        replace(
          <<-EOT
            1. Be respectful and appropriate
            Our goal is to create a tight-knit community where everyone is welcome and kind to each other. To achieve this, there will absolutely be no sexual content, homophobia, racism, transphobia, or body shaming of any of kind.

            2. No spamming of any kind
            We love to see members active in the server, but please don't spam unnecessarily. Feel free to make a thread if you want to have an in-depth discussion about a topic. The exception to this are <#${discord_text_channel.off_topic.id}> and <#${discord_text_channel.bot_commands.id}>.

            3. Keep chats in the relevant channels
            This goes without saying, but please keep chats in the relevant topic or class channels.

            4. Discord's TOS and Community Guidelines
            You must abide by the rules noted in Discord's [Terms of Service](https://discord.com/terms) and [Community Guidelines](https://discord.com/guidelines).
          EOT
        , "\r\n", "\n")
      )
    }

    fields {
      name   = "Report an Issue"
      inline = false
      value  = chomp(
        <<-EOT
          We work hard to make the UAS community a safe place for everyone but acknowledge that this isn't always possible. If you have an issue with anyone at any time and don't feel comfortable talking to them directly, please reach out to either the captain or one of the leads (whoever you feel most comfortable talking to).
        EOT
      )
    }
  }
}

resource "discord_message" "resources" {
  channel_id = discord_text_channel.about.id
  depends_on = [discord_message.rules]

  embed {
    title       = "Team Resources"
    color       = data.discord_color.uas_blue.dec
    description = chomp(
      <<-EOT
        UAS operates on a variety of platforms to take advantage of the best tools for each task. To find all of these tools and resources please visit the [Confluence home page](https://ubcuas.atlassian.net/wiki).
      EOT
    )
  }
}