@echo off
setlocal
cd /d "%~dp0"

where npm >nul 2>&1
if errorlevel 1 (
  echo Node.js is required only to BUILD the .exe once — not to run it afterward.
  echo Install Node.js LTS from https://nodejs.org/ then run this script again.
  pause
  exit /b 1
)

if not exist "node_modules\" (
  echo Installing build dependencies...
  call npm install
  if errorlevel 1 (
    echo.
    echo Build failed during npm install. If you see UNABLE_TO_GET_ISSUER_CERT_LOCALLY,
    echo fix corporate proxy/SSL for npm or build on a machine with registry access.
    pause
    exit /b 1
  )
)

echo Building portable Windows executable...
call npm run pack:win
if errorlevel 1 (
  pause
  exit /b 1
)

echo.
echo Done. Copy this file anywhere and double-click to run ^(no Node needed^):
echo   %~dp0release\MarkdownLivePreview-Portable.exe
echo.
pause
endlocal
