workflow "Welcome first-time contributor" {
  on = "pull_request"
  resolves = "Post welcome comment"
}

action "Created pull request" {
  uses = "actions/bin/filter@d820d56839906464fb7a57d1b4e1741cf5183efa"
  args = "action opened"
}

action "First contribution" {
  uses = "actions/first-contribution@v1.0.0"
  needs = "Created pull request"
  secrets = ["GITHUB_TOKEN"]
}

action "Post welcome comment" {
  uses = "actions/github@v1.0.0"
  runs = ["/bin/sh", "-c", "node /entrypoint.js comment \"$WELCOME_COMMENT\""]
  needs = "First contribution"
  secrets = ["GITHUB_TOKEN", "WELCOME_COMMENT"]
}
