@echo off
setlocal
cd /d "%~dp0"

where npm >nul 2>&1
if errorlevel 1 (
  echo Node.js/npm is required. Install from https://nodejs.org/
  pause
  exit /b 1
)

if not exist "node_modules\" (
  echo Installing dependencies (Electron is optional; this mode uses your browser only)...
  call npm install --omit=optional
  if errorlevel 1 (
    echo.
    echo If install failed with UNABLE_TO_GET_ISSUER_CERT_LOCALLY, fix corporate proxy/SSL
    echo or ask IT for npm registry access, then run this script again.
    pause
    exit /b 1
  )
)

if not exist "dist\index.html" (
  echo Building application...
  call npm run build
  if errorlevel 1 exit /b 1
)

start "" "http://127.0.0.1:5001/"
echo Serving on http://127.0.0.1:5001/ only ^(not reachable from other machines^).
echo Close this window to stop the server.
call npx http-server dist -p 5001 -c-1 -a 127.0.0.1
endlocal
