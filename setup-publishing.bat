@echo off
REM Quick setup script for publishing Templ Syntax Extension (Windows)
REM Run this script to prepare for publishing

echo 🚀 Setting up Templ Syntax Extension for Publishing
echo ==================================================

REM Check Node.js and npm
echo 📋 Checking prerequisites...

where node >nul 2>nul
if %errorlevel% neq 0 (
    echo ❌ Node.js not found. Please install Node.js first.
    exit /b 1
)

where npm >nul 2>nul
if %errorlevel% neq 0 (
    echo ❌ npm not found. Please install npm first.
    exit /b 1
)

echo ✅ Node.js and npm found

REM Install publishing tools
echo 📦 Installing publishing tools...
call npm install -g vsce ovsx

if %errorlevel% equ 0 (
    echo ✅ Publishing tools installed successfully
) else (
    echo ❌ Failed to install publishing tools
    exit /b 1
)

REM Build extension
echo 🔨 Building extension...
call npm install
if %errorlevel% neq 0 (
    echo ❌ npm install failed
    exit /b 1
)

call npm run compile
if %errorlevel% neq 0 (
    echo ❌ Extension build failed
    exit /b 1
)

echo ✅ Extension built successfully

REM Test package creation
echo 📋 Testing package creation...
call vsce package --no-git-tag-version --no-update-package-json

if %errorlevel% equ 0 (
    echo ✅ Package creation test successful
    REM Clean up test package
    del /f *.vsix 2>nul
) else (
    echo ❌ Package creation test failed
    exit /b 1
)

echo.
echo 🎉 Setup Complete!
echo.
echo Next steps:
echo 1. Create publisher accounts:
echo    - VS Code Marketplace: https://marketplace.visualstudio.com/manage
echo    - Open VSX: https://open-vsx.org/
echo.
echo 2. Update package.json with your publisher ID
echo 3. Run publish.bat to publish your extension
echo.
echo For detailed instructions, see PUBLISHING.md

pause