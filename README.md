# sungyun98.github.io

Source for my personal homepage, [sungyun98.github.io](https://sungyun98.github.io).

## Structure

| Path                            | Contents                                                     |
| ------------------------------- | ------------------------------------------------------------ |
| `_pages/`                       | About, publications, and repositories pages                  |
| `_bibliography/papers.bib`      | Publication list, rendered by jekyll-scholar                 |
| `_data/`                        | Social links, GitHub repositories, venues, citation counts   |
| `assets/img/`, `assets/pdf/`    | Profile photo, CV, and thesis                                |
| `_plugins/bibtex_typography.rb` | BibTeX filters for `\textsubscript{}` and `\textminus`       |
| `_config.yml`, `Gemfile`        | Site settings and theme plugins (keep the two lists in sync) |

## Local preview

Requires Ruby 3.3 and ImageMagick.

```bash
bundle install
bundle exec jekyll serve   # http://localhost:4000/
```

Before pushing, check formatting (CI runs the same check):

```bash
npm ci
npm run lint:prettier      # `npx prettier . --write` fixes issues
```

## Deployment

Pushing to `main` runs `.github/workflows/deploy.yml`, which builds the site and publishes it to the `gh-pages` branch. Other workflows:

- `prettier.yml`: formatting check on every push and pull request
- `broken-links-site.yml`: checks internal links after each deploy
- `upgrade-check.yml`: runs `bundle exec al-folio upgrade audit` against the theme's config contract
- `update-citations.yml`: refreshes Google Scholar citation counts three times a week (needs the `PAT` repository secret)

## Credits

Built with the [al-folio](https://github.com/alshedivat/al-folio) Jekyll theme (v1.2). The theme code is available under the MIT License; see [LICENSE](LICENSE). Site content (text, photos, and documents) © Sung Yun Lee.
