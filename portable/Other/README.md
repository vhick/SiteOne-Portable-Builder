# SiteOne Crawler Portable (Windows CLI)

This is an **unofficial** portable wrapper for the **official** SiteOne Crawler CLI.

**No PAF, no installer, no extra runtime required.** The `.exe` downloaded by
GitHub Actions is the official Windows binary, with browser rendering present
in the upstream prebuilt release.

## Files

- `App/siteone-crawler.exe` — official program (replaceable on update)
- `Data/` — reports, Markdown exports, crawler HTTP cache and settings; keep it
- `Other/` — documentation
- `SiteOneCrawler.cmd` — general-purpose portable CLI launcher
- `Open-SiteOne-Terminal.cmd` — command prompt opened in the portable folder
- `SEO-Audit.cmd` — guided standard SEO scan
- `JS-to-Markdown.cmd` — guided JS-rendered website-to-Markdown export

## Getting started

1. Unzip the **portable ZIP produced by the Actions workflow**, not the builder kit.
2. Run `SEO-Audit.cmd` to enter a website address and run a basic SEO crawl.
3. For a JavaScript-rendered site, run `JS-to-Markdown.cmd` instead. Chrome or
   Edge must be installed or Chromium available to the crawler; the upstream
   program can offer to download a browser on first use.
4. Find default HTML, JSON and TXT reports under `Data/tmp/`. Find your
   Markdown exports under `Data/Exports/Markdown/<date-time>/`.

For advanced commands, run `Open-SiteOne-Terminal.cmd`, then type:

```bat
SiteOneCrawler.cmd --help
SiteOneCrawler.cmd --url=https://example.com
SiteOneCrawler.cmd --url=https://example.com --browser
```

The general-purpose CMD launcher changes directory to `Data` before starting
SiteOne. Relative output paths supplied on the command line are therefore
relative to `Data`.

## Updates

Download a new portable ZIP from the Actions workflow. **Keep the existing
`Data` folder.** You can replace `App`, `Other` and root `.cmd` files with the
new copies. Do not delete, reset, or replace your existing Data folder.

## Portability notes

- The CLI itself is provided by its author as a standalone executable.
- `SiteOneCrawler.cmd` redirects the common home/profile, temporary, cache,
  and application-data environment variables to `Data`, and explicitly sets
  the crawler's HTTP cache and configuration file paths.
- This is not sandboxing: a browser installed elsewhere, the OS, antivirus,
  proxy settings and networking facilities can still touch system-wide data.
- Launching `App/siteone-crawler.exe` directly bypasses these protections.
- Existing Chrome/Edge browser binaries are NOT copied into the ZIP.
- Configurable browser settings and temporary browser profiles are upstream-
  controlled and are not guaranteed to be fully contained by this wrapper.

Official project: https://github.com/janreges/siteone-crawler
Official license: https://github.com/janreges/siteone-crawler/blob/main/LICENSE
