@echo off
title Jarvis AI Assistant (Desktop Window)
cd /d "%~dp0"

echo ===================================================
echo      Starting Jarvis AI Assistant (Desktop Window)
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

"%~dp0.venv\Scripts\python.exe" -m dodaios

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo [!] Notice: Desktop window exited with code %ERRORLEVEL%.
    echo You can also run the web browser interface using: start-jarvis-web.bat
    pause
)
