Portable user data lives here. Preserve this entire Data folder when upgrading.
- Config/siteone-crawler.conf: your CLI defaults
- Cache/HTTP: website HTTP cache
- Exports/Audits/<domain>/<date-time>: full website SEO reports and Markdown
- Exports/Markdown: output from the JS-to-Markdown launcher
- tmp/: default HTML/JSON/TXT audit reports
- Profile/: redirected user/application support files
- Temp/: redirected temporary files

Browser rendering can use an installed system browser. This is not a complete
sandbox: Windows and separate browsers may still create system-level traces.
Use the root .cmd launchers for the intended portable behavior.
