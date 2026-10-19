@echo off
setlocal EnableExtensions DisableDelayedExpansion
cd /d "%~dp0" || exit /b 1
title SiteOne Crawler - JS Rendering and Markdown Export
set "TARGET="
echo.
set /p "TARGET=Website address (for example https://example.com): "
if not defined TARGET (
    echo No website supplied.
    pause
    exit /b 1
)
rem A new folder for each run prevents accidentally replacing older exports.
for /f %%I in ('powershell.exe -NoProfile -Command "Get-Date -Format yyyyMMdd-HHmmss"') do set "RUNID=%%I"
if not defined RUNID set "RUNID=latest"
set "OUTPUT=%~dp0Data\Exports\Markdown\%RUNID%"
if not exist "%OUTPUT%" mkdir "%OUTPUT%" >nul 2>&1
echo.
echo Rendering website with installed Chrome / Edge if available.
echo Output folder: "%OUTPUT%"
echo.
call "%~dp0SiteOneCrawler.cmd" --url="%TARGET%" --browser --markdown-export-dir="%OUTPUT%\Pages" --markdown-export-single-file="%OUTPUT%\All-Pages.md"
set "CODE=%ERRORLEVEL%"
echo.
echo Crawler finished with exit code %CODE%.
echo Markdown output: "%OUTPUT%"
echo Audit report: Data\tmp\
pause
endlocal & exit /b %CODE%
