resource "discord_webhook" "webhook" {
    channel_id      = discord_text_channel.software_reviews.id
    name            = "GitHub"
    avatar_url      = "https://github.githubassets.com/pinned-octocat.svg"
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