@echo off
title Stop Jarvis AI Assistant
cd /d "%~dp0"

echo ===================================================
echo      Stopping Jarvis AI Assistant Processes
echo ===================================================
echo.

powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0stop-jarvis.ps1"

echo.
ping 127.0.0.1 -n 3 >nul
