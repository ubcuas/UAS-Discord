# UAS Discord Server

UBC Uncrewed Aircraft Systems Discord server defined with Terraform.

## Purpose

By defining the Discord server with Terraform, we can easily version control changes and have those changes be
applied in a safe and repeatable manner. It also reduces the need for permissions management for server settings
since we can give only the bot account and UAS account the ability to make changes.

## Backend

The storage backend is defined in [`versions.tf`](src/versions.tf) and is currently set to Terraform Cloud. This
allows for automatic `plan`s on pull requests and `apply`s on merge to `master`. All the secrets are also stored
in Terraform Cloud as sensitive variables.

## Structure

Within the [`src`](src) directory, all the Terraform files can be found. The [`static`](static) directory holds
images being used. They are organized as follows:

```
static/
    discord-icon.png       # Discord server icon
    logo.png               # UAS logo for messages
src/
    categories.tf          # Channel categories
    channels.tf            # Channels
    colours.tf             # Various colours used throughout
    main.tf                # Main configuration (server and invite link)
    members.tf             # Bot role assignment
    messages.tf            # Verify and informaton messages sent by the bot
    permissions.tf         # Permissions for roles, channels, and categories
    providers.tf           # Provider configuration
    roles.tf               # Roles
    variables.tf           # Variables
    versions.tf            # Terraform provider versions and backend configuration
    webhooks.tf            # Webhook configuration
```