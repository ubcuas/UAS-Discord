provider discord {
  token = var.terraform_bot_token
}

provider "github" {
  token = var.github_token
  owner = "ubcuas"
}