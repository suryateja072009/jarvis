@echo off
title Jarvis AI Assistant (Web Mode)
cd /d "%~dp0"

echo ===================================================
echo      Starting Jarvis AI Assistant (Web Mode)
echo ===================================================
echo.
echo Directory: %~dp0
echo.

if not exist "%~dp0.venv\Scripts\python.exe" (
    echo [!] Virtual environment not found at %~dp0.venv
    echo Please run setup.bat first to initialize the environment.
    pause
    exit /b 1
)

echo Launching local server at http://127.0.0.1:47821 ...
echo Keep this command window open while using Jarvis.
echo To stop Jarvis, close this window or run stop-jarvis.bat.
echo.

start "" "http://127.0.0.1:47821"

"%~dp0.venv\Scripts\python.exe" -m dodaios serve

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo [!] Server process exited with code %ERRORLEVEL%.
    pause
)
