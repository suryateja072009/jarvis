@echo off
title Jarvis AI Assistant Setup
cd /d "%~dp0"

echo ===================================================
echo      Jarvis AI Assistant Environment Setup
echo ===================================================
echo.

where python >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo [!] Error: Python is not found in PATH.
    echo Please install Python 3.11 or newer and add it to PATH.
    pause
    exit /b 1
)

if not exist "%~dp0.venv" (
    echo [*] Creating Python virtual environment in .venv ...
    python -m venv "%~dp0.venv"
    if %ERRORLEVEL% NEQ 0 (
        echo [!] Failed to create virtual environment.
        pause
        exit /b 1
    )
) else (
    echo [*] Virtual environment .venv already exists.
)

echo [*] Upgrading pip ...
"%~dp0.venv\Scripts\python.exe" -m pip install --upgrade pip

echo [*] Installing dependencies from requirements.txt ...
"%~dp0.venv\Scripts\python.exe" -m pip install -r "%~dp0requirements.txt"

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ===================================================
    echo      Setup Completed Successfully!
    echo ===================================================
    echo.
    echo You can now launch Jarvis using:
    echo   - start-jarvis.bat      (Desktop Window)
    echo   - start-jarvis-web.bat  (Web Browser Mode)
    echo.
) else (
    echo.
    echo [!] Dependency installation encountered an error.
)

pause
