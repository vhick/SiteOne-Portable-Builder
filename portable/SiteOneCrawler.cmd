@echo off
rem SiteOne Crawler Portable CLI launcher.
rem All changes to the environment are local to this CMD process and its children.
setlocal EnableExtensions DisableDelayedExpansion
set "ROOT=%~dp0"
set "EXE=%ROOT%App\siteone-crawler.exe"

if not exist "%EXE%" (
    echo ERROR: The official SiteOne Crawler EXE is missing.
    echo Expected file: "%EXE%"
    echo Run the GitHub Actions builder and use its generated portable ZIP.
    exit /b 1
)

for %%D in (
    "%ROOT%Data" "%ROOT%Data\Config" "%ROOT%Data\Cache\HTTP"
    "%ROOT%Data\Exports" "%ROOT%Data\Temp" "%ROOT%Data\Profile"
    "%ROOT%Data\Profile\AppData\Roaming" "%ROOT%Data\Profile\AppData\Local"
) do if not exist "%%~D" mkdir "%%~D" >nul 2>&1

rem Redirect commonly used home, cache, settings and temp locations.
set "USERPROFILE=%ROOT%Data\Profile"
set "HOME=%ROOT%Data\Profile"
set "APPDATA=%ROOT%Data\Profile\AppData\Roaming"
set "LOCALAPPDATA=%ROOT%Data\Profile\AppData\Local"
set "XDG_CACHE_HOME=%ROOT%Data\Cache"
set "XDG_DATA_HOME=%ROOT%Data\Profile\Data"
set "XDG_CONFIG_HOME=%ROOT%Data\Config"
set "TEMP=%ROOT%Data\Temp"
set "TMP=%ROOT%Data\Temp"

rem By starting from Data, default report files go to Data\tmp.
pushd "%ROOT%Data" || (echo ERROR: Cannot open Data directory. & exit /b 1)
"%EXE%" --config-file="%ROOT%Data\Config\siteone-crawler.conf" --http-cache-dir="%ROOT%Data\Cache\HTTP" %*
set "EXIT_CODE=%ERRORLEVEL%"
popd
endlocal & exit /b %EXIT_CODE%
