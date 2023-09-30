## Jira

# You can find the webhook URL by downloading the Terraform state from
# https://app.terraform.io/app/ubcuas/workspaces/UAS-Discord/states. The URL
# then gets put into https://skyhookapi.com/ with the Jira button selected.
# The resulting URL is then put into the Jira webhook settings found here:
# https://ubcuas.atlassian.net/plugins/servlet/webhooks
resource "discord_webhook" "jira_webhook" {
  channel_id      = discord_text_channel.admin_notifications.id
  name            = "Jira"
  avatar_url      = "https://raw.githubusercontent.com/ubcuas/UAS-Discord/master/static/jira.png"
}

resource "discord_webhook" "jira_aircraft_webhook" {
  channel_id      = discord_text_channel.aircraft_jira.id
  name            = "Jira"
  avatar_url      = "https://raw.githubusercontent.com/ubcuas/UAS-Discord/master/static/jira.png"
}

resource "discord_webhook" "jira_payload_webhook" {
  channel_id      = discord_text_channel.payload_jira.id
  name            = "Jira"
  avatar_url      = "https://raw.githubusercontent.com/ubcuas/UAS-Discord/master/static/jira.png"
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