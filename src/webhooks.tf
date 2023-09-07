## Jira

resource "discord_webhook" "jira_webhook" {
  channel_id      = discord_text_channel.admin_notifications.id
  name            = "Jira"
  avatar_url      = "https://www.stagil.com/hubfs/jira%20work%20management.svg"
}

## GitHub

resource "discord_webhook" "webhook" {
  channel_id      = discord_text_channel.software_reviews.id
  name            = "GitHub"
  avatar_url      = "https://github.githubassets.com/app-icon-512.png"
}

resource "github_organization_webhook" "software_reviews" {
  active = true
  events = ["pull_request"]

  configuration {
    url          = discord_webhook.webhook.github_url
    content_type = "json"
    insecure_ssl = false
  }
}