# pr-dependency

This repository implements a GitHub Actions workflow that is triggered every time a PR is merged. The workflow searches for references made in other PRs (from other repositories) to the merged PR (from this repository) and, if the mention occurred on a tasklist item, it checks that item.

This repository is used alongside [pr-dependent](https://github.com/lucastrschneider/pr-dependent) to test the automation.

## Next steps

- Investigate behavior when repository that referenced the PR belongs to other user/organization;
  - Maybe check if the the action has permission to edit comments on the target repository before sending the request;
- Search for checklists in the comments, not only in PR's body.

## Useful links

- [GitHub Docs](https://docs.github.com/en)
  - [Running your `pull_request` workflow when a pull request merges](https://docs.github.com/en/actions/using-workflows/events-that-trigger-workflows#running-your-pull_request-workflow-when-a-pull-request-merges)
  - [Using GitHub CLI in workflows](https://docs.github.com/en/actions/using-workflows/using-github-cli-in-workflows)
  - [REST API: Get an issue](https://docs.github.com/en/rest/issues/issues?apiVersion=2022-11-28#get-an-issue)
  - [REST API: Update an issue](https://docs.github.com/en/rest/issues/issues?apiVersion=2022-11-28#update-an-issue)
  - [Autolinked references and URLs](https://docs.github.com/en/get-started/writing-on-github/working-with-advanced-formatting/autolinked-references-and-urls)
- [GitHub CLI Manual](https://cli.github.com/manual/)
  - [`gh api`](https://cli.github.com/manual/gh_api)
- [jq Cheat Sheet](https://lzone.de/cheat-sheet/jq)
- [`sed` Command in Linux/Unix with examples](https://www.geeksforgeeks.org/sed-command-in-linux-unix-with-examples/)