workflow "Run Tests" {
  on = "push"
  resolves = "Test Matrix"
}

action "Test Matrix" {
  uses = "actions/node-matrix@v1.0.0"
  args = ["10", "11"]
  secrets = ["GITHUB_TOKEN"]
}
