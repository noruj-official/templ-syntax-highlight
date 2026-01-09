@echo off
REM Publishing script for Templ Syntax Extension (Windows)
REM This script helps publish to both Microsoft Marketplace and Open VSX

echo 🚀 Templ Syntax Extension Publishing Script
echo ==========================================

REM Check if vsce is installed
where vsce >nul 2>nul
if %errorlevel% neq 0 (
    echo ❌ vsce not found. Installing...
    npm install -g vsce
)

REM Check if ovsx is installed
where ovsx >nul 2>nul
if %errorlevel% neq 0 (
    echo ❌ ovsx not found. Installing...
    npm install -g ovsx
)

REM Build the extension
echo 📦 Building extension...
call npm install
if %errorlevel% neq 0 (
    echo ❌ npm install failed.
    exit /b 1
)

call npm run compile
if %errorlevel% neq 0 (
    echo ❌ Build failed. Please check for errors.
    exit /b 1
)

REM Package the extension
echo 📋 Packaging extension...
call vsce package
if %errorlevel% neq 0 (
    echo ❌ Packaging failed.
    exit /b 1
)

echo.
echo Choose publishing option:
echo 1) Publish to Microsoft Marketplace only
echo 2) Publish to Open VSX only
echo 3) Publish to both
echo 4) Just package (no publishing)
echo.

set /p choice=Enter your choice (1-4): 

if "%choice%"=="1" (
    echo 🎯 Publishing to Microsoft Marketplace...
    call vsce publish
    if %errorlevel% equ 0 (
        echo ✅ Published to Microsoft Marketplace!
    ) else (
        echo ❌ Publishing to Microsoft Marketplace failed.
    )
) else if "%choice%"=="2" (
    echo 🎯 Publishing to Open VSX...
    call ovsx publish
    if %errorlevel% equ 0 (
        echo ✅ Published to Open VSX!
    ) else (
        echo ❌ Publishing to Open VSX failed.
    )
) else if "%choice%"=="3" (
    echo 🎯 Publishing to Microsoft Marketplace...
    call vsce publish
    if %errorlevel% equ 0 (
        echo ✅ Published to Microsoft Marketplace!
    ) else (
        echo ❌ Publishing to Microsoft Marketplace failed.
    )
    
    echo 🎯 Publishing to Open VSX...
    call ovsx publish
    if %errorlevel% equ 0 (
        echo ✅ Published to Open VSX!
    ) else (
        echo ❌ Publishing to Open VSX failed.
    )
) else if "%choice%"=="4" (
    echo 📦 Extension packaged successfully!
    echo Package file created in current directory.
) else (
    echo ❌ Invalid choice. Exiting.
    exit /b 1
)

echo.
echo 🎉 Publishing process complete!
echo.
echo Next steps:
echo 1. Check your extension on the marketplace
echo 2. Test installation from marketplace
echo 3. Share with the community!
echo.
echo Microsoft Marketplace: https://marketplace.visualstudio.com/manage
echo Open VSX: https://open-vsx.org/user-settings/extensions

pause