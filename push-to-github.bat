@echo off
title Push Jarvis to GitHub
cd /d "%~dp0"

echo ===================================================
echo      Pushing Jarvis AI to GitHub
echo ===================================================
echo.
echo Target: https://github.com/suryateja072009/jarvis
echo Branch: main
echo.
echo A browser window will open if GitHub sign-in is required.
echo Please click "Authorize" in your browser.
echo.

set "PATH=C:\Program Files\Git\cmd;%PATH%"

git push -u origin main

echo.
if %ERRORLEVEL% EQU 0 (
    echo ===================================================
    echo      Successfully pushed to GitHub!
    echo ===================================================
) else (
    echo [!] Push could not complete. Check your internet connection or sign-in.
)

echo.
pause
