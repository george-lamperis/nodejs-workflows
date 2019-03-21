workflow "Scan for license violations" {
  on = "pull_request"
  resolves = "Check licenses"
}

action "Files changed (license scan)" {
  uses = "actions/bin/filter@d820d56839906464fb7a57d1b4e1741cf5183efa"
  args = "action 'opened|synchronize'"
}

action "Check licenses" {
  uses = "actions/licensed/node@v1.0.0"
  needs = "Files changed (license scan)"
  args = "status"
}
