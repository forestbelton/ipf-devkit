@echo off
set name=%1
set host=https://github.com/forestbelton/libipf/releases/download/v1.02

call :toupper %name%
set uppername=%ret%

if not exist %~dp0ipf.exe (
    powershell -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; (New-Object Net.WebClient).DownloadFile('%host%/ipf.exe', '%~dp0ipf.exe')"
    powershell -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; (New-Object Net.WebClient).DownloadFile('%host%/libipf.dll', '%~dp0libipf.dll')"
)

mkdir %name% || goto :eof
mkdir %name%\src\addon_d.ipf\%name%

copy %~dp0\ipf.exe %name%\ipf.exe >NUL
copy %~dp0\libipf.dll %name%\libipf.dll >NUL

rem Script template
(
echo %uppername% = _G["%uppername%"] or {}
echo(
echo function %uppername%_ON_INIT ^(addon, frame^)
echo end
) >%name%\src\addon_d.ipf\%name%\%name%.lua

rem UI template
(
echo ^<?xml version="1.0" encoding="UTF-8"?^>
echo ^<uiframe name="%name%" x="0" y="0" width="0" height="0" create="open"^>
echo ^<controls /^>
echo ^</uiframe^>
) >%name%\src\addon_d.ipf\%name%\%name%.xml

rem Packaging and deploy script
(
echo @echo off
echo ipf %name%.ipf src
echo chcp 65001
echo copy %name%.ipf "C:\\Program Files (x86)\\Steam\\steamapps\\common\TreeOfSavior\\data\\%name%​.ipf"
) >%name%\deploy-ipf.bat

echo Project `%name%' created.
goto :eof

:toupper
setlocal
for /f "usebackq delims=" %%I in (`powershell "\"%1\".toUpper()"`) do set "upper=%%~I"
endlocal & set ret=%upper%
goto :eof
