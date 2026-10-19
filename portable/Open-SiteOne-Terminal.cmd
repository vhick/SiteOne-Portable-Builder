@echo off
setlocal EnableExtensions
cd /d "%~dp0" || exit /b 1
title SiteOne Crawler Portable - Command Prompt
if not exist "App\siteone-crawler.exe" (
  echo The crawler EXE was not found. Use the built ZIP from GitHub Actions.
  pause
  exit /b 1
)
echo =====================================================
echo SiteOne Crawler - Portable Command Prompt
echo =====================================================
echo.
echo Examples:
echo   SiteOneCrawler.cmd --help
echo   SiteOneCrawler.cmd --url=https://example.com
echo   SiteOneCrawler.cmd --url=https://example.com --browser
echo.
echo Reports and cache are saved under Data\.
echo Type exit to close this window.
echo.
cmd /k
