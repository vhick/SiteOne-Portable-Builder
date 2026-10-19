# SiteOne Crawler Portable — GitHub Actions builder kit

**This ZIP is the builder kit, not the finished application.**
A manually run GitHub Actions workflow downloads the official Windows executable
and creates a complete portable ZIP with `App/`, `Data/` and `Other/`.

## Quick setup with GitHub Desktop (recommended)

1. Create an **empty public GitHub repository** named `siteone-crawler-portable`.
   Do **not** fork the original repository: this builder is its own repo.
2. Open it in **GitHub Desktop** (`Code` -> `Open with GitHub Desktop` or clone).
3. Extract this entire builder kit into the cloned repository folder, keeping
   `.github/workflows/build-siteone-portable.yml` and `portable/` folders.
4. In GitHub Desktop, commit the new files and select **Push origin**.
5. Open your repository on GitHub, select **Actions**, then
   **Build SiteOne Crawler Portable CLI (Manual)** -> **Run workflow**.
6. Leave **version blank** for the latest stable upstream release. Keep
   **architecture x64** for most Windows PCs. Click **Run workflow**.
7. Once successful, open the run's **Artifacts** section and download the ZIP.
   GitHub may give you an outer artifact ZIP containing the portable ZIP; extract
   the outer ZIP first.
8. Extract `SiteOneCrawlerPortable-v...-win-x64.zip` to a folder on your PC or
   USB drive and run `SEO-Audit.cmd` or `JS-to-Markdown.cmd`.

## If you only use the GitHub website

GitHub's web uploader often hides folders beginning with a dot. Instead:

1. Create a new file in the GitHub website named
   `.github/workflows/build-siteone-portable.yml`.
2. Open the provided `BUILD-WORKFLOW-COPY.txt` and paste all its text.
3. Upload the `portable/` folder's contents and preserve its paths, or use
   GitHub Desktop to avoid the folder-by-folder upload work.

## How updates work

Run the same workflow again with **version blank**. It downloads the newest
stable release published by the official developer. After extracting the new
portable ZIP, **keep your existing `Data` folder**; replace only `App`, `Other`
and the root launcher `.cmd` files.

## Why not compile from source?

Since v2.0.0, SiteOne is a single native Rust executable. The official Windows
release already supports the CLI and browser rendering, so downloading the
publisher's release avoids unnecessary build complexity.

## What is included in the finished portable ZIP?

```text
SiteOneCrawlerPortable/
  SiteOneCrawler.cmd
  Open-SiteOne-Terminal.cmd
  SEO-Audit.cmd
  JS-to-Markdown.cmd
  App/
    siteone-crawler.exe         (official release binary)
  Data/                        (preserve on updates)
    Config/siteone-crawler.conf
    Cache/HTTP/
    Exports/Markdown/
    Temp/
    Profile/
    tmp/                       (created by the crawler)
  Other/
    README.md
```

The executable is NOT included in this *builder kit* because the workflow gets
it from the original project at build time.

Upstream: https://github.com/janreges/siteone-crawler
