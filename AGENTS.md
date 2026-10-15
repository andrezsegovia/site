# AGENTS.md

Personal Hugo static site (digital garden) for andrezsc.com. A single theme
(`hugo-bearblog`) plus local layouts; no app code, no tests, no linter. The content
is authored in Obsidian.

## Build / preview

- Requires **Hugo extended** (CI pins `0.148.0`; Dart Sass is used). Install it or
  match the CI version. `hugo version` should report the extended build.
- The theme is a git submodule and arrives **empty** after a fresh clone. Before any
  build, run:
  ```
  git submodule update --init --recursive
  ```
- Dev server: `hugo server` (add `-D` to include drafts; `baseURL` is `https://andrezsc.com/`).
- Production build (matches CI): `hugo --gc --minify`.

## Deploy

- Push to `main` triggers `.github/workflows/hugo.yaml`, which builds with Hugo
  extended and deploys `./public` to GitHub Pages. No manual deploy step.

## Content model

Content lives under `content/` and is split into sections: `articles`, `notes`,
`tils`, `bookmarks`, `blogroll`. `_index.md` in each section sets its title.

Front matter conventions (see existing files, not the `templates/` folder):
- `type` is set to the section name (`tils`, `notes`, `bookmark`, ...).
- `categories` is a YAML list; untriaged drafts use `- Draft`.
- `date` is the note's own date; `publishDate` is the day it was published to the
  site. Vault-published notes (`brain/publish.py`) set both.
- Draft pages set `draft: true` and won't render without `-D`.
- Bookmarks are **redirect stubs**: `type: bookmark` + `params.bookmarkUrl: <url>`.
  `layouts/bookmark/single.html` renders the redirect, `layouts/bookmarks/list.html`
  renders the section list, and the RSS template reads `bookmarkUrl`. A missing value
  renders a "No external URL found" fallback instead of redirecting.
- `blogroll` is a single hand-maintained page (markdown list), not per-item pages.

`templates/` is **not** Hugo archetypes — it holds Obsidian Templater templates
(`{{title}}`, `{{date:...}}`). Hugo's archetype is `archetypes/default.md`. Both
are ignored from content (`ignoreFiles` in `hugo.toml`) / used by tooling.

## Layout / theming notes

- `hugo.toml` declares `theme = 'hugo-bearblog'`, but `layouts/` overrides most
  rendering (home, lists, single, RSS, bookmarks, blogroll). Edit `layouts/`, not the
  submodule themes (leave submodules unmodified).
- `assets/main.css` is minified at build via `layouts/partials/custom_head.html`.
- `resources/_gen/` is generated asset cache and is gitignored; don't hand-edit.
- `public/` is gitignored. `content/.obsidian` is ignored.
