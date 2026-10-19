# SiteOne Crawler Portable (Universal Windows CLI)

Unofficial portable command-line wrapper around the official Windows SiteOne Crawler executable. No PAF installation or compilation required.

## Launchers

- `Full-Website-Audit.cmd`: enter **any** website URL for a complete JavaScript-rendered SEO audit and Markdown export. Each run writes to `Data/Exports/Audits/<domain>/<timestamp>/` and generates `Pages/`, `All-Pages.md`, `SEO-Report.html`, `URL-Details.json`, `URLs.txt`.
- `SEO-Audit.cmd`: enter any site for a basic SEO crawl. Default HTML/JSON/TXT reports are under `Data/tmp/`.
- `JS-to-Markdown.cmd`: enter any site for JavaScript-rendered Markdown export. Results under `Data/Exports/Markdown/<timestamp>/`.
- `Open-SiteOne-Terminal.cmd`: open the portable command line for advanced options.
- `SiteOneCrawler.cmd`: main launcher that redirects the configuration, cache, temp, and user profile paths to `Data/`.

You can enter a full `https://` or `http://` URL in the full audit launcher, or enter a bare domain name and HTTPS will be assumed.

For advanced commands use `Open-SiteOne-Terminal.cmd`, then enter:

```bat
SiteOneCrawler.cmd --help
SiteOneCrawler.cmd --url=https://example.com --browser
```

## Updates

Replace `App/`, `Other/` and root `.cmd` files with newer versions from the GitHub Actions artifact. **Preserve the entire existing `Data/` folder.**

## Portability and browser notes

- The official Windows CLI is a standalone executable.
- `SiteOneCrawler.cmd` changes the working directory to `Data/`; relative paths in commands are thus relative to `Data/`.
- An installed Chrome, Edge, or supported Chromium-family browser is required for browser rendering; the upstream crawler may offer to download one.
- Windows and external browsers may still create traces elsewhere. This wrapper is not a sandbox.
- Launching `App/siteone-crawler.exe` directly bypasses portable path redirection.

Official project: https://github.com/janreges/siteone-crawler
