## Jira

resource "discord_webhook" "jira_webhook" {
  channel_id      = discord_text_channel.admin_notifications.id
  name            = "Jira"
  avatar_url      = "https://www.vhv.rs/dpng/d/545-5452076_jira-logo-jira-icon-png-transparent-png-download.png"
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