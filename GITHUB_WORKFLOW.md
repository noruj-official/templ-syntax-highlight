# GitHub Repository Setup and Publishing Workflow

This guide walks you through setting up a GitHub repository for your Templ Syntax Extension and publishing it to Open VSX.

## Step 1: Git Repository Setup

### Initialize Git Repository
```bash
git init
git add .
git commit -m "Initial commit: Templ Syntax Highlight VS Code Extension"
```

### Create GitHub Repository
1. Go to [https://github.com/new](https://github.com/new)
2. Create a new repository with name: `templ-syntax-highlight`
3. Keep it public (recommended for open source extensions)
4. Don't initialize with README (we already have one)
5. Copy the repository URL (HTTPS or SSH)

### Connect Local to Remote
```bash
git remote add origin https://github.com/YOUR_USERNAME/templ-syntax-highlight.git
git branch -M main
git push -u origin main
```

## Step 2: Repository Structure

Your repository should contain:
```
templ-syntax-highlight/
├── .gitignore                    # Updated with comprehensive exclusions
├── .vscode/                      # VS Code configuration
│   ├── launch.json              # Debug configurations
│   └── tasks.json               # Build tasks
├── CHANGELOG.md                 # Version history
├── PUBLISHING.md               # Publishing instructions
├── README.md                   # Main documentation
├── example.templ               # Example file for testing
├── icons/                      # Extension icons
│   ├── templ-dark.svg
│   └── templ-light.svg
├── language-configuration.json # Language configuration
├── package.json                # Extension manifest
├── snippets/                   # Code snippets
│   └── templ.json
├── src/                        # TypeScript source
│   └── extension.ts
├── syntaxes/                   # Syntax highlighting grammar
│   └── templ.tmLanguage.json
├── themes/                     # Color themes
│   └── templ-dark-color-theme.json
└── tsconfig.json              # TypeScript configuration
```

## Step 3: Pre-Publishing Checklist

### Update package.json
Ensure these fields are correct:
- `name`: Extension identifier
- `displayName`: Human-readable name
- `description`: Clear description
- `version`: Semantic version
- `publisher`: Your publisher ID (from marketplace)
- `repository`: Your GitHub repository URL
- `keywords`: Relevant search terms

### Create Extension Icon
Convert your SVG icons to PNG format:
- Create `icons/templ-icon.png` (128x128 pixels)
- Update `package.json` icon field

### Test Extension
```bash
npm install
npm run compile
```

Press `F5` in VS Code to test the extension.

## Step 4: Publishing to Open VSX

### Install Open VSX CLI
```bash
npm install -g ovsx
```

### Create Open VSX Account
1. Go to [https://open-vsx.org/](https://open-vsx.org/)
2. Sign in with GitHub, GitLab, or Eclipse account
3. Go to User Settings → Access Tokens
4. Create a new access token

### Publish to Open VSX
```bash
# Build and package
npm run compile
vsce package

# Publish to Open VSX
ovsx publish
```

### Alternative: Use Publishing Scripts
```bash
# Setup everything
./setup-publishing.sh    # or setup-publishing.bat on Windows

# Publish
./publish.sh              # or publish.bat on Windows
# Choose option 2 for Open VSX only
```

## Step 5: Post-Publishing

### Verify Publication
- Check your extension: `https://open-vsx.org/extension/YOUR_PUBLISHER/templ-syntax-highlight`
- Test installation from Open VSX

### Update Repository
```bash
git add .
git commit -m "Publish version 1.0.0 to Open VSX"
git push origin main
```

### Create GitHub Release
1. Go to your repository on GitHub
2. Click "Releases" → "Create a new release"
3. Tag version: `v1.0.0`
4. Release title: "Version 1.0.0"
5. Add release notes from CHANGELOG.md
6. Upload the `.vsix` package file
7. Publish release

## Step 6: Maintenance

### Version Updates
1. Update version in `package.json`
2. Update `CHANGELOG.md`
3. Commit and push changes
4. Create new GitHub release
5. Publish to Open VSX

### Monitor Issues
- Watch your GitHub repository for issues
- Monitor Open VSX for reviews and feedback
- Respond to user questions and bug reports

## Quick Commands Reference

```bash
# Git setup
git init
git add .
git commit -m "Initial commit"
git remote add origin https://github.com/YOUR_USERNAME/templ-syntax-highlight.git
git push -u origin main

# Publishing
npm install -g ovsx
ovsx publish

# Or use the script
./publish.sh  # Choose option 2 for Open VSX
```

## Troubleshooting

### Common Issues

1. **Authentication failed**
   - Ensure you're logged in to Open VSX
   - Check your access token is valid
   - Try creating a new token

2. **Extension already exists**
   - Choose a different name in package.json
   - Or claim ownership if it's yours

3. **Build errors**
   - Run `npm install` first
   - Check TypeScript compilation
   - Verify all files are present

4. **Git push fails**
   - Check remote URL is correct
   - Ensure you have push permissions
   - Try HTTPS instead of SSH

For more help, see [PUBLISHING.md](PUBLISHING.md) or check the [Open VSX documentation](https://github.com/eclipse/openvsx/wiki).