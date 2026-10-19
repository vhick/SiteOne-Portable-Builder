@echo off
setlocal EnableExtensions DisableDelayedExpansion
cd /d "%~dp0" || exit /b 1
title SiteOne Crawler - SEO Audit
set "TARGET="
echo.
set /p "TARGET=Website address (for example https://example.com): "
if not defined TARGET (
    echo No website supplied.
    pause
    exit /b 1
)
echo.
echo Starting standard SEO audit for: "%TARGET%"
echo Reports will be saved to Data\tmp\.
echo.
call "%~dp0SiteOneCrawler.cmd" --url="%TARGET%"
set "CODE=%ERRORLEVEL%"
echo.
echo Crawler finished with exit code %CODE%.
echo See the reports in Data\tmp\.
pause
endlocal & exit /b %CODE%
