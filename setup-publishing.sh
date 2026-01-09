#!/bin/bash

# Quick setup script for publishing Templ Syntax Extension
# Run this script to prepare for publishing

echo "🚀 Setting up Templ Syntax Extension for Publishing"
echo "=================================================="

# Check Node.js and npm
echo "📋 Checking prerequisites..."
if ! command -v node &> /dev/null; then
    echo "❌ Node.js not found. Please install Node.js first."
    exit 1
fi

if ! command -v npm &> /dev/null; then
    echo "❌ npm not found. Please install npm first."
    exit 1
fi

echo "✅ Node.js and npm found"

# Install publishing tools
echo "📦 Installing publishing tools..."
npm install -g vsce ovsx

if [ $? -eq 0 ]; then
    echo "✅ Publishing tools installed successfully"
else
    echo "❌ Failed to install publishing tools"
    exit 1
fi

# Build extension
echo "🔨 Building extension..."
npm install
npm run compile

if [ $? -eq 0 ]; then
    echo "✅ Extension built successfully"
else
    echo "❌ Extension build failed"
    exit 1
fi

# Test package creation
echo "📋 Testing package creation..."
vsce package --no-git-tag-version --no-update-package-json

if [ $? -eq 0 ]; then
    echo "✅ Package creation test successful"
    # Clean up test package
    rm -f *.vsix
else
    echo "❌ Package creation test failed"
    exit 1
fi

echo ""
echo "🎉 Setup Complete!"
echo ""
echo "Next steps:"
echo "1. Create publisher accounts:"
echo "   - VS Code Marketplace: https://marketplace.visualstudio.com/manage"
echo "   - Open VSX: https://open-vsx.org/"
echo ""
echo "2. Update package.json with your publisher ID"
echo "3. Run publish.sh to publish your extension"
echo ""
echo "For detailed instructions, see PUBLISHING.md"