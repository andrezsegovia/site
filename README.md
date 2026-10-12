# andrezsc.com

My personal website and digital garden — a place to drop notes, thoughts, and
"Today I Learned" fragments. Built with [Hugo](https://gohugo.io/) and published
to GitHub Pages.

**Live site:** <https://andrezsc.com/>

The site follows the ideas of [digital gardening](https://maggieappleton.com/garden-history)
and [learning in public](https://www.swyx.io/learn-in-public).

## Tech stack

- **Hugo extended 0.148.0** — static site generator (extended build is required
  for the Dart Sass/asset pipeline).
- **[hugo-bearblog](https://github.com/janraasch/hugo-bearblog)** — declared theme,
  but most rendering is overridden by local templates in `layouts/`.
- **GitHub Pages** — hosting, deployed automatically via GitHub Actions.
- **Obsidian** — content is authored in Obsidian; `templates/` contains Obsidian
  Templater templates (not Hugo archetypes).

## Requirements

- [Git](https://git-scm.com/)
- **Hugo extended**, version **0.148.0** (the version pinned in CI)
- [Dart Sass](https://sass-lang.com/dart-sass) — used by the asset pipeline

## Getting started

The theme is a git submodule and arrives **empty** on a fresh clone. Initialize
it before doing anything else:

```bash
git clone --recurse-submodules <repo-url>
cd andrezsc.com
```

If you already cloned without `--recurse-submodules`, run:

```bash
git submodule update --init --recursive
```

Without this step the build fails or renders without the base theme.

## Local development

Start the dev server with live reload:

```bash
hugo server
```

Include draft content (`draft: true`):

```bash
hugo server -D
```

The dev server binds `baseURL` to `https://andrezsc.com/` (see `hugo.toml`).

## Production build

Reproduce the CI build locally:

```bash
hugo --gc --minify
```

Output is written to `public/`, which is gitignored.

## Project structure

```text
.
├── archetypes/          # Hugo archetype used by `hugo new`
│   └── default.md
├── assets/
│   └── main.css         # site styles, minified at build time
├── content/             # all site content (authored in Obsidian)
│   ├── _index.md        # home page
│   ├── articles/        # long-form articles
│   ├── notes/           # notes / book highlights
│   ├── tils/            # short "Today I Learned" posts
│   ├── bookmarks/       # redirect stubs to external links
│   └── blogroll/        # single hand-maintained list of links
├── layouts/             # local templates that override the theme
│   ├── _default/        # single, list, terms, RSS, summary
│   ├── bookmark/        # redirect single for bookmark stubs
│   ├── bookmarks/       # bookmark section list
│   ├── blogroll/        # blogroll page
│   ├── partials/        # custom_head (CSS) and nav
│   └── _shortcodes/     # tableOfContent
├── static/              # static assets served as-is (favicon)
├── templates/           # Obsidian Templater templates (NOT Hugo archetypes)
├── resources/_gen/      # generated asset cache (gitignored)
├── themes/              # git submodule (hugo-bearblog; empty until initialized)
├── hugo.toml            # site configuration
└── .github/workflows/   # GitHub Pages deployment
```

## Content model

Content lives under `content/` and is split into sections:

| Section | `type` | Purpose |
|---|---|---|
| `articles` | `articles` | Long-form articles |
| `notes` | `notes` | Notes and book highlights |
| `tils` | `tils` | Short "Today I Learned" snippets |
| `bookmarks` | `bookmark` | Redirect stubs to external URLs |
| `blogroll` | — | Single hand-maintained markdown list |

Each section has an `_index.md` that sets its title.

### Front matter conventions

```yaml
---
title: "My Note"
date: 2025-03-19T09:16:36-05:00
draft: false
weight: 1
type: notes              # set to the section name
categories:
 - Notes                 # YAML list; untriaged drafts use `- Draft`
---
```

- `type` is set to the section name (`tils`, `notes`, `bookmark`, ...).
- `categories` is a YAML list.
- Draft pages use `draft: true` and are hidden unless you build/serve with `-D`.

### Bookmarks

Bookmarks are **redirect stubs**, not full pages. They use `type: bookmark` and a
`params.bookmarkUrl`:

```yaml
---
title: "A Single Text File Is My Productivity Hack"
date: 2025-03-20T19:17:05-05:00
draft: false
weight: 1
type: bookmark
params:
  bookmarkUrl: https://jagcoop.github.io/posts/Single_text_file/
categories:
 - Bookmarks
---
```

`layouts/bookmarks/*` and the RSS template read `bookmarkUrl`. A missing value
renders a "missing bookmarkUrl" placeholder.

### Blogroll

`content/blogroll/_index.md` is a single hand-maintained page — a markdown list, not
one page per link:

```markdown
- [Derek Sivers](https://sive.rs/)
- [Gwern Branwen](https://gwern.net/)
```

## Creating content

Use Hugo's archetype to scaffold a new page:

```bash
hugo new content notes/my-new-note.md
```

This uses `archetypes/default.md`. Remember: `templates/` is **Obsidian
Templater**, not Hugo archetypes. It holds `Basic.md` and `Bookmark.md` with
`{{title}}` / `{{date:...}}` placeholders, and is excluded from content via
`ignoreFiles` in `hugo.toml`.

## Layouts and theming

- `hugo.toml` declares `theme = 'hugo-bearblog'`, but `layouts/` overrides most
  rendering (home, lists, single pages, RSS, bookmarks, blogroll).
- **Edit `layouts/`, not the submodule themes.** Leave submodules unmodified.
- `assets/main.css` is minified at build time through
  `layouts/partials/custom_head.html` (`resources.Get "main.css" | minify`).
- `resources/_gen/` is generated cache that happens to be committed — do not
  hand-edit it.

## Deployment

Deployment is automatic. Pushing to `main` triggers
`.github/workflows/hugo.yaml`, which:

1. Installs Hugo extended `0.148.0` and Dart Sass.
2. Checks out the repo **with submodules** (`--recurse-submodules`).
3. Builds with `hugo --gc --minify`.
4. Publishes `./public` to GitHub Pages.

There is no manual deploy step. The workflow can also be run manually via
`workflow_dispatch`.

## Notes and gotchas

- The theme is a submodule — always initialize it before building.
- `resources/_gen/` and `.hugo_build.lock` are generated and gitignored; don't commit them.
- Bookmark redirects are rendered by `layouts/bookmark/single.html` (the singular
  `bookmark/` directory matches `type: bookmark`); the section list lives in
  `layouts/bookmarks/list.html`.

## License

Personal project. All rights reserved unless otherwise noted.
