# Label pull requests automatically

This workflow parses a `.github/pr-labels.yml` file. When pull requests are opened (or pushed to), labels will be added according to that configuration file.

In order to use it, you'll want to add a `.github/pr-labels.yml` file to your repository. For example, in order to label pull requests that change CSS files as `css`, you would have this configuration:

```yaml
css:
  - '**/*.css'
```