#!/bin/bash

# Publishing script for Templ Syntax Extension
# This script helps publish to both Microsoft Marketplace and Open VSX

echo "🚀 Templ Syntax Extension Publishing Script"
echo "=========================================="

# Check if vsce is installed
if ! command -v vsce &> /dev/null; then
    echo "❌ vsce not found. Installing..."
    npm install -g vsce
fi

# Check if ovsx is installed
if ! command -v ovsx &> /dev/null; then
    echo "❌ ovsx not found. Installing..."
    npm install -g ovsx
fi

# Build the extension
echo "📦 Building extension..."
npm install
npm run compile

if [ $? -ne 0 ]; then
    echo "❌ Build failed. Please check for errors."
    exit 1
fi

# Package the extension
echo "📋 Packaging extension..."
vsce package

if [ $? -ne 0 ]; then
    echo "❌ Packaging failed."
    exit 1
fi

echo ""
echo "Choose publishing option:"
echo "1) Publish to Microsoft Marketplace only"
echo "2) Publish to Open VSX only"
echo "3) Publish to both"
echo "4) Just package (no publishing)"
echo ""

read -p "Enter your choice (1-4): " choice

case $choice in
    1)
        echo "🎯 Publishing to Microsoft Marketplace..."
        vsce publish
        echo "✅ Published to Microsoft Marketplace!"
        ;;
    2)
        echo "🎯 Publishing to Open VSX..."
        ovsx publish
        echo "✅ Published to Open VSX!"
        ;;
    3)
        echo "🎯 Publishing to Microsoft Marketplace..."
        vsce publish
        echo "✅ Published to Microsoft Marketplace!"
        
        echo "🎯 Publishing to Open VSX..."
        ovsx publish
        echo "✅ Published to Open VSX!"
        ;;
    4)
        echo "📦 Extension packaged successfully!"
        echo "Package file created in current directory."
        ;;
    *)
        echo "❌ Invalid choice. Exiting."
        exit 1
        ;;
esac

echo ""
echo "🎉 Publishing process complete!"
echo ""
echo "Next steps:"
echo "1. Check your extension on the marketplace"
echo "2. Test installation from marketplace"
echo "3. Share with the community!"
echo ""
echo "Microsoft Marketplace: https://marketplace.visualstudio.com/manage"
echo "Open VSX: https://open-vsx.org/user-settings/extensions"