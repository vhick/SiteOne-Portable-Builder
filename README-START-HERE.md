# SiteOne Crawler Portable — Universal GitHub Builder

This kit builds an **unofficial Windows CLI portable ZIP** using the official SiteOne Crawler releases and a **manually run GitHub Actions** workflow. No PAF installer, build tools, or Rust compilation required.

**This is the GitHub repository kit.** It does not include `siteone-crawler.exe`; the GitHub workflow downloads the official binary and publishes the finished portable ZIP under Actions > Artifacts.

## Update your existing GitHub repository

1. Open your **existing SiteOne portable-builder repository** in GitHub Desktop.
2. Extract the contents of this ZIP directly into that repository's root. Keep the `.github` and `portable` folders intact. Allow overwrites.
3. **Important: delete `portable/PER-Method-Audit.cmd` from the existing repository.** Extracting a ZIP will not delete old files. The new GitHub workflow also excludes this old launcher from built portable archives as a safeguard.
4. In GitHub Desktop, **Commit to main** and **Push origin**.
5. In GitHub, open **Actions > Build SiteOne Crawler Portable CLI (Manual) > Run workflow**. Leave version blank for the latest stable official release and select x64 for most Windows PCs.
6. When the run is successful, download its artifact, then extract the final `SiteOneCrawlerPortable-v...-win-x64.zip` to your chosen directory.

## Universal portable commands

- `Full-Website-Audit.cmd` — enter **any website**, get JavaScript-rendered SEO audit, per-page Markdown, combined Markdown, JSON, and TXT URL list. This is the universal replacement for the website-specific audit command.
- `SEO-Audit.cmd` — basic SEO scan for any site.
- `JS-to-Markdown.cmd` — enter any site and export JavaScript-rendered pages to Markdown.
- `Open-SiteOne-Terminal.cmd` — interactive terminal for custom SiteOne commands.
- `SiteOneCrawler.cmd` — launch SiteOne with portable cache, settings, and data paths.

### Universal full-audit output

For `https://example.com`, the files appear in a folder resembling:

```text
SiteOneCrawlerPortable/
├── Full-Website-Audit.cmd
├── SEO-Audit.cmd
├── JS-to-Markdown.cmd
├── Open-SiteOne-Terminal.cmd
├── SiteOneCrawler.cmd
├── App/siteone-crawler.exe
├── Data/
│   ├── Config/siteone-crawler.conf
│   ├── Cache/
│   ├── Exports/
│   │   └── Audits/example.com/20261019-083000/
│   │       ├── Pages/               (separate Markdown pages)
│   │       ├── All-Pages.md
│   │       ├── SEO-Report.html
│   │       ├── URL-Details.json
│   │       └── URLs.txt
│   ├── Temp/
│   └── Profile/
└── Other/README.md
```

Each run makes a new date-and-time folder, so exports from different websites are kept separate. The full audit retains browser rendering with two workers, a maximum of two requests per second, and the Markdown/report flags used previously.

## Upgrade without losing settings or reports

Run the manual GitHub workflow again. Replace the existing portable app's `App/`, `Other/` and root `.cmd` files with the new ZIP contents, but **keep your existing entire `Data/` folder**. Do not delete, reset or overwrite Data. The workflow retains its generated GitHub artifact for one day.

## Limitations

`--browser` requires a Chromium-family browser, such as Chrome or Edge, installed or otherwise available to SiteOne. The portable wrapper redirects common cache/profile/temp variables into `Data/` but cannot guarantee that Windows or a separate browser creates no system traces. Run SiteOne using the root launchers, not `App/siteone-crawler.exe`, for the intended portable behavior.

The workflow contains the previously corrected handling for the upstream `--version` exit code of 2. SiteOne's official CLI documentation: https://crawler.siteone.io/configuration/command-line-options/
Official repository: https://github.com/janreges/siteone-crawler
