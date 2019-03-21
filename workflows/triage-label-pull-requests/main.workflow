workflow "Apply triage labels" {
  on = "pull_request"
  resolves = "Apply labels"
}

action "Files changed (triage labels)" {
  uses = "actions/bin/filter@d820d56839906464fb7a57d1b4e1741cf5183efa"
  args = "action 'opened|synchronize'"
}

action "Apply labels" {
  uses = "actions/labeler@v1.0.0"
  needs = "Files changed (triage labels)"
  env = {LABEL_SPEC_FILE=".github/pr-labels.yml"}
  secrets = ["GITHUB_TOKEN"]
}
