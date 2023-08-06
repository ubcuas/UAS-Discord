provider discord {
  token = var.uas_bot_token
}

provider "github" {
  token = var.github_token
  owner = "ubcuas"
}