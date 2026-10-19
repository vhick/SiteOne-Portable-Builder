@echo off
rem Interactive website audit. Works with any HTTP/HTTPS website.
rem Each run gets a separate domain- and date-stamped folder under Data\Exports.
setlocal EnableExtensions DisableDelayedExpansion
cd /d "%~dp0" || exit /b 1
title SiteOne Crawler Portable - Full Website SEO Audit

set "TARGET="
set /p "TARGET=Website URL (example: https://example.com): "
if not defined TARGET (
    echo ERROR: No website URL was entered.
    pause
    exit /b 1
)

rem Parse the site domain safely using built-in Windows PowerShell.
rem A URL without http:// or https:// is treated as HTTPS.
set "TARGET_URL="
set "SITE="
for /f "usebackq tokens=1,* delims=|" %%A in (`powershell.exe -NoProfile -Command "$s=$env:TARGET.Trim(); if ($s -notmatch '^https?://') { $s='https://'+$s }; try { $u=[uri]$s; if (($u.Scheme -notin @('http','https')) -or [string]::IsNullOrWhiteSpace($u.DnsSafeHost)) { exit 1 }; $name=$u.DnsSafeHost -replace '[^A-Za-z0-9._-]','_'; Write-Output ($u.AbsoluteUri+'|'+$name) } catch { exit 1 }"`) do (
    set "TARGET_URL=%%A"
    set "SITE=%%B"
)
if not defined SITE (
    echo ERROR: Invalid website address. Please enter a valid website URL.
    pause
    exit /b 1
)

for /f %%I in ('powershell.exe -NoProfile -Command "Get-Date -Format yyyyMMdd-HHmmss"') do set "RUNID=%%I"
if not defined RUNID set "RUNID=latest"
set "EXPORT=%~dp0Data\Exports\Audits\%SITE%\%RUNID%"
if not exist "%EXPORT%\Pages" mkdir "%EXPORT%\Pages" >nul 2>&1
if not exist "%EXPORT%\Pages" (
    echo ERROR: Could not create output folder: "%EXPORT%"
    pause
    exit /b 1
)

echo.
echo =============================================================
echo  SiteOne Crawler - Full Website SEO + Markdown Audit
echo =============================================================
echo  Website: %TARGET_URL%
echo  Reports: "%EXPORT%"
echo  Browser rendering: ON
 echo  Browser workers: 2; maximum requests per second: 2
echo.
echo  Chrome, Edge, or another supported Chromium browser is needed.
echo.
call "%~dp0SiteOneCrawler.cmd" ^
  --url="%TARGET_URL%" ^
  --browser ^
  --browser-workers=2 ^
  --max-reqs-per-sec=2 ^
  --markdown-export-dir="%EXPORT%\Pages" ^
  --markdown-export-single-file="%EXPORT%\All-Pages.md" ^
  --markdown-move-content-before-h1-to-end ^
  --markdown-disable-images ^
  --output-html-report="%EXPORT%\SEO-Report.html" ^
  --output-json-file="%EXPORT%\URL-Details.json" ^
  --sitemap-txt-file="%EXPORT%\URLs.txt"
set "CODE=%ERRORLEVEL%"
echo.
echo SiteOne crawler exited with code %CODE%.
echo Check report output: "%EXPORT%"
echo.
pause
endlocal & exit /b %CODE%
