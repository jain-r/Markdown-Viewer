@echo off
setlocal
cd /d "%~dp0"

if exist "release\MarkdownLivePreview-Portable.exe" (
  echo Starting portable app ^(no Node required^)...
  start "" "release\MarkdownLivePreview-Portable.exe"
  exit /b 0
)

where npm >nul 2>&1
if errorlevel 1 (
  echo No portable .exe found. Run Build-Portable-Exe.bat once on a PC with Node.js,
  echo or copy MarkdownLivePreview-Portable.exe into the release\ folder.
  pause
  exit /b 1
)

if not exist "node_modules\" (
  echo Installing dependencies...
  call npm install
  if errorlevel 1 exit /b 1
)

if not exist "dist\index.html" (
  echo Building application...
  call npm run build
  if errorlevel 1 exit /b 1
)

call npx --yes electron@35 .
endlocal
