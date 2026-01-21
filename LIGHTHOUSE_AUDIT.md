# Lighthouse Audit Summary

Generated from unlighthouse scan of 38 pages.

## Current Scores (Range)

| Category | Min | Max | Target |
|----------|-----|-----|--------|
| Performance | 75 | 91 | 100 |
| Accessibility | 85 | 100 | 100 |
| Best Practices | 79 | 100 | 100 |
| SEO | 100 | 100 | 100 |

## Issues to Fix

### High Priority (Performance)

1. **Eliminate render-blocking resources**
   - CSS is loaded synchronously in `<head>`
   - Fix: Inline critical CSS or use `media="print" onload` pattern

2. **Reduce unused CSS**
   - Tailwind outputs full utility classes
   - Fix: Already using cssnano in production; consider PurgeCSS tuning

3. **Serve images in next-gen formats**
   - Images are JPG/PNG
   - Fix: Convert to WebP with `<picture>` fallback

4. **Properly size images**
   - Large images served at smaller display sizes
   - Fix: Generate responsive image sizes

5. **Enable text compression**
   - This is handled by Netlify CDN (gzip/brotli)
   - Verify: Check `Content-Encoding` header

### Medium Priority (Accessibility)

1. **Insufficient color contrast**
   - `text-stone-500` links may fail 4.5:1 contrast
   - Fix: Use `text-stone-600` for better contrast

2. **Touch targets too small**
   - Links in footer may be too close together
   - Fix: Add padding to touch targets (min 48x48px)

### Low Priority (Best Practices)

1. **iframe missing title** (embedded videos)
   - YouTube/Vimeo embeds need `title` attribute
   - Fix: Add descriptive titles to iframes

2. **Third-party cookies**
   - From embedded content (YouTube, etc.)
   - Fix: Use `youtube-nocookie.com` or facade pattern

3. **Third-party code impact**
   - Fathom analytics script
   - Fix: Already async, minimal impact

### Not Actionable

- **Main-thread work** - Inherent to page rendering
- **bfcache** - Often blocked by third-party scripts
- **Network dependency tree** - Informational only

## Fix Priority Order

1. [x] Convert images to WebP format (main images converted)
2. [ ] Generate responsive image sizes
3. [x] Fix color contrast (stone-500 → stone-600)
4. [x] Increase touch target sizes
5. [x] Add titles to iframes in posts
6. [ ] Consider critical CSS inlining

## Pages with Lowest Scores

| Page | Perf | A11y | BP | Issue |
|------|------|------|-----|-------|
| day-in-the-life-of-google-glass | 75 | 92 | 96 | Images |
| ff-chartwell | 75 | 100 | 100 | Images |
| why-instagram-is-so-damn-fast | 78 | 100 | 79 | Embed |
| dj-spirograph | 88 | 93 | 79 | YouTube embed |
| field-studies-for-product-designers | 87 | 93 | 79 | Vimeo embed |
