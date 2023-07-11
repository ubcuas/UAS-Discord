terraform {
  cloud {
    organization = "ubcuas"
    workspaces {
      name = "UAS-Discord"
    }
  }
  required_providers {
    discord = {
      source = "Lucky3028/discord"
    }
  }
}