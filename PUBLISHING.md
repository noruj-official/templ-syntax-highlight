# Publishing Your Templ Syntax Extension

This guide will walk you through publishing your VS Code extension to both the Microsoft Visual Studio Code Marketplace and Open VSX.

## Prerequisites

1. **Node.js and npm** installed
2. **VS Code** installed
3. Your extension code ready and tested

## Step 1: Install Publishing Tools

### Install vsce (Visual Studio Code Extension manager)
```bash
npm install -g vsce
```

### Install ovsx (Open VSX CLI)
```bash
npm install -g ovsx
```

## Step 2: Prepare Your Extension

### 1. Build Your Extension
```bash
npm install
npm run compile
```

### 2. Test Your Extension
- Press `F5` in VS Code to test in Extension Development Host
- Verify all features work correctly
- Test the example.templ file

### 3. Update package.json
Ensure your <mcfile name="package.json" path="c:\Noor\workspace\templ-syntax\package.json"></mcfile> has all required fields:
- `name`: Extension identifier (lowercase, no spaces)
- `displayName`: Human-readable name
- `description`: Clear description
- `version`: Semantic version
- `publisher`: Your publisher ID (you'll create this)
- `repository`: GitHub repository URL
- `icon`: Path to icon file (128x128 pixels)
- `keywords`: Array of searchable keywords

## Step 3: Create Publisher Accounts

### Microsoft Visual Studio Code Marketplace

1. Go to [https://marketplace.visualstudio.com/manage](https://marketplace.visualstudio.com/manage)
2. Sign in with your Microsoft account
3. Click "Create publisher"
4. Fill in publisher details:
   - Publisher name (used in extension URLs)
   - Display name
   - Description
   - Website
   - Support email

5. Note your publisher ID (you'll use this in package.json)

### Open VSX Registry

1. Go to [https://open-vsx.org/](https://open-vsx.org/)
2. Sign in with GitHub, GitLab, or Eclipse account
3. Go to user settings/access tokens
4. Create an access token
5. Note your access token for publishing

## Step 4: Update Extension Metadata

### Add Publisher to package.json
```json
{
  "publisher": "your-publisher-name",
  "repository": {
    "type": "git",
    "url": "https://github.com/yourusername/templ-syntax"
  },
  "icon": "icons/templ-icon.png",
  "keywords": [
    "templ",
    "go",
    "golang",
    "template",
    "syntax",
    "highlighting"
  ]
}
```

### Create Extension Icon (128x128 PNG)
Convert your SVG icons to PNG format for the marketplace:
- `icons/templ-icon.png` (128x128 pixels)
- Make sure it looks good at small sizes

### Add README Sections for Marketplace
Update your <mcfile name="README.md" path="c:\Noor\workspace\templ-syntax\README.md"></mcfile> with:
- Installation instructions
- Screenshots of syntax highlighting
- Usage examples
- Feature list
- Support information

## Step 5: Package and Publish

### Create Extension Package
```bash
vsce package
```
This creates a `.vsix` file in your project directory.

### Test the Package Locally
```bash
code --install-extension templ-syntax-1.0.0.vsix
```

### Publish to Microsoft Marketplace
```bash
vsce publish
```
Or specify a version:
```bash
vsce publish 1.0.0
```

### Publish to Open VSX
```bash
ovsx publish
```
If you need to specify a namespace:
```bash
ovsx publish --namespace your-namespace
```

## Step 6: Post-Publishing Tasks

### 1. Verify Publication
- Check Microsoft Marketplace: `https://marketplace.visualstudio.com/items?itemName=your-publisher.templ-syntax`
- Check Open VSX: `https://open-vsx.org/extension/your-publisher/templ-syntax`

### 2. Install from Marketplace
Test installation from both marketplaces:
```bash
# Microsoft Marketplace
code --install-extension your-publisher.templ-syntax

# Open VSX
code --install-extension your-publisher.templ-syntax --extensions-dir ~/.vscode-ovsx/extensions
```

### 3. Update Documentation
Add installation links to your README:
```markdown
## Installation

### VS Code Marketplace
[Install from VS Code Marketplace](https://marketplace.visualstudio.com/items?itemName=your-publisher.templ-syntax)

### Open VSX
[Install from Open VSX](https://open-vsx.org/extension/your-publisher/templ-syntax)
```

## Step 7: Maintenance and Updates

### Version Updates
1. Update version in <mcfile name="package.json" path="c:\Noor\workspace\templ-syntax\package.json"></mcfile>
2. Update <mcfile name="CHANGELOG.md" path="c:\Noor\workspace\templ-syntax\CHANGELOG.md"></mcfile>
3. Build and test locally
4. Publish to both marketplaces:
   ```bash
   vsce publish
   ovsx publish
   ```

### Monitoring
- Check marketplace pages for reviews and issues
- Monitor GitHub issues
- Respond to user feedback
- Keep dependencies updated

## Troubleshooting

### Common Issues

1. **Publisher not found**
   - Ensure you're logged in with correct account
   - Check publisher name in package.json matches your account

2. **Icon not displaying**
   - Ensure icon is 128x128 PNG format
   - Check file path is correct

3. **Extension not appearing in search**
   - Wait 10-15 minutes for indexing
   - Check keywords are relevant
   - Verify all metadata is complete

4. **Open VSX namespace issues**
   - Claim your namespace on Open VSX
   - Use `--namespace` flag if needed

### Support Resources
- [VS Code Extension Publishing Docs](https://code.visualstudio.com/api/working-with-extensions/publishing-extension)
- [Open VSX Documentation](https://github.com/eclipse/openvsx/wiki)
- [VSCE GitHub](https://github.com/microsoft/vscode-vsce)

## Quick Reference Commands

```bash
# Install publishing tools
npm install -g vsce ovsx

# Build extension
npm install
npm run compile

# Package extension
vsce package

# Publish to Microsoft Marketplace
vsce publish

# Publish to Open VSX
ovsx publish

# Test installation
code --install-extension templ-syntax-1.0.0.vsix
```

Good luck with publishing your templ syntax highlighting extension! 🚀