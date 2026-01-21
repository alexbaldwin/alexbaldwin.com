# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Build Commands

```bash
# Install dependencies
bundle install
npm install

# Local development server (with live reload)
bundle exec jekyll serve

# Production build
JEKYLL_ENV=production bundle exec jekyll build
```

## Architecture

This is a Jekyll 4 personal website using:

- **Jekyll** (Ruby 3.2.2) for static site generation
- **Tailwind CSS** with `@tailwindcss/typography` for styling
- **PostCSS** with jekyll-postcss-v2 for CSS processing (cssnano in production)

### Key Directories

- `_posts/` - Blog posts in Markdown
- `_layouts/` - `default.html` (base template) and `post.html` (wraps default)
- `_includes/` - Reusable HTML partials
- `assets/css/main.css` - Tailwind entry point (uses Jekyll front matter for processing)

### Jekyll Plugins

- `jekyll-seo-tag` - SEO meta tags via `{% seo %}` in layout
- `jekyll-og-image` - Auto-generates Open Graph images to `assets/images/og/`
- `jekyll-sitemap` and `jekyll-feed` - Auto-generated sitemap and RSS

### Styling

All styling uses Tailwind utility classes directly in HTML. The typography plugin handles prose styling for Markdown content. Custom font (GeistSans) is loaded via `@font-face` in the layout.

## Deployment

Hosted on **Netlify**. Configuration in `netlify.toml`.

### Testing Risky Changes

For changes that might break deploys (netlify.toml, Gemfile, build config):

```bash
# 1. Test with preview deploy first
netlify deploy

# 2. Verify the preview URL works
# 3. Then deploy to production
netlify deploy --prod

# 4. Only after confirming, commit and push
git add . && git commit -m "message" && git push

# 5. Monitor the git-triggered deploy
netlify api listSiteDeploys --data '{"site_id": "cc93a9b2-d44a-47af-b8ea-37993706da4c"}' | jq '.[0] | {state, title}'
```

### Useful Commands

```bash
netlify status   # Check site status
netlify watch    # Monitor active deploys
netlify logs     # View function logs
```
