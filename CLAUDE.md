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
