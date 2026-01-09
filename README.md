# Templ Syntax Highlight for VS Code

A Visual Studio Code extension that provides syntax highlighting, snippets, and language support for [templ](https://templ.guide) template files in Go applications.

## Features

- **Syntax Highlighting**: Full syntax highlighting for templ files including:
  - Component definitions
  - HTML elements and attributes
  - Embedded CSS and JavaScript blocks
  - Go expressions within templates
  - Templ-specific keywords and directives

- **Code Snippets**: Pre-built snippets for common templ patterns:
  - `tcomponent` - Create a new templ component
  - `tcss` - Add a CSS block
  - `tscript` - Add a JavaScript block
  - `tif` - Create conditional blocks
  - `tfor` - Create loops
  - And more!

- **Language Features**:
  - Auto-completion for templ keywords and HTML tags
  - Hover information for templ-specific constructs
  - Basic document formatting
  - Custom icons for templ files

- **Dark Theme**: Includes a custom dark theme optimized for templ syntax

## Installation

### From VS Code Marketplace (Recommended)
1. Open VS Code
2. Go to Extensions view (`Ctrl+Shift+X` / `Cmd+Shift+X`)
3. Search for "Templ Syntax Highlight"
4. Click Install

### From Open VSX Registry
1. Visit [Open VSX](https://open-vsx.org/extension/shaik-noor/templ-syntax-highlight)
2. Download the `.vsix` file
3. In VS Code, go to Extensions view
4. Click "..." menu → "Install from VSIX..."
5. Select the downloaded file

### Manual Installation
1. Download the latest release from [GitHub Releases](https://github.com/noruj-official/templ-syntax-highlight/releases)
2. In VS Code, go to Extensions view
3. Click "..." menu → "Install from VSIX..."
4. Select the downloaded `.vsix` file

**Note:** After installation, open any `.templ` file to activate syntax highlighting.

## Quick Start

1. **Install the extension** from VS Code Marketplace or Open VSX
2. **Open a `.templ` file** - syntax highlighting activates automatically
3. **Try the examples** - use the provided `example.templ` file or create your own
4. **Use snippets** - type `tcomp` and press Tab to create a new component

## Usage

### File Recognition
The extension automatically recognizes files with the `.templ` extension and applies templ syntax highlighting.

### Code Snippets
Type the snippet prefix and press `Tab` to expand:

- `tcomponent` - Creates a new templ component
```templ
component ComponentName(params) {
	return (
		<div>
			// Component content
		</div>
	)
}
```

- `tcss` - Creates a CSS block
```templ
css {
	// CSS styles
}
```

- `tscript` - Creates a JavaScript block
```templ
script {
	// JavaScript code
}
```

### Syntax Highlighting
The extension provides syntax highlighting for:
- Templ component definitions (blue)
- Templ keywords like `component`, `css`, `script` (purple, bold)
- HTML tags (blue)
- HTML attributes (light blue)
- Go expressions (light blue)
- CSS blocks (orange)
- JavaScript blocks (blue)
- Comments (green, italic)

### Commands
- **Templ: Show Info** - Display extension information and links
  - Access via Command Palette (`Ctrl+Shift+P` / `Cmd+Shift+P`)
  - Type "Templ: Show Info"

## Examples

### Basic Component
```templ
component Hello(name string) {
	return (
		<div class="hello">
			<h1>Hello, { name }!</h1>
		</div>
	)
}
```

### Component with CSS
```templ
css {
	.hello {
		color: blue;
		font-size: 24px;
	}
}

component Hello(name string) {
	return (
		<div class="hello">
			<h1>Hello, { name }!</h1>
		</div>
	)
}
```

### Component with JavaScript
```templ
script {
	function greet(name) {
		console.log('Hello, ' + name);
	}
}

component Hello(name string) {
	return (
		<button onclick="greet('{ name }')">
			Click me
		</button>
	)
}
```

### Conditional Rendering
```templ
component Conditional(show bool) {
	return (
		<div>
			if show {
				<p>This is shown when show is true</p>
			} else {
				<p>This is shown when show is false</p>
			}
		</div>
	)
}
```

### Loops
```templ
component List(items []string) {
	return (
		<ul>
			for _, item := range items {
				<li>{ item }</li>
			}
		</ul>
	)
}
```

## Configuration

The extension respects VS Code's editor settings for:
- Tab size
- Insert spaces vs tabs
- Formatting preferences

## Development

To contribute or modify this extension:

### Setup
1. **Clone the repository:**
   ```bash
   git clone https://github.com/noruj-official/templ-syntax-highlight.git
   cd templ-syntax-highlight
   ```

2. **Install dependencies:**
   ```bash
   npm install
   ```

### Development Workflow
1. **Make your changes** to the relevant files:
   - `syntaxes/templ.tmLanguage.json` - Syntax highlighting rules
   - `snippets/templ.json` - Code snippets
   - `themes/templ-dark-color-theme.json` - Color theme
   - `src/extension.ts` - Extension logic
   - `language-configuration.json` - Language settings

2. **Compile the extension:**
   ```bash
   npm run compile
   ```

3. **Test in VS Code:**
   - Press `F5` to open a new Extension Development Host window
   - Open the `example.templ` file to test syntax highlighting
   - Try the snippets by typing `tcomp` and pressing Tab

### Testing
- Use the `example.templ` file to test all features
- Check syntax highlighting for different templ constructs
- Verify snippets work correctly
- Test the dark theme

### Building
- Run `npm run compile` to build TypeScript files
- Run `npx vsce package` to create a `.vsix` package

## File Structure

```
templ-syntax-highlight/
├── package.json                    # Extension manifest
├── language-configuration.json     # Language configuration
├── tsconfig.json                   # TypeScript configuration
├── src/
│   └── extension.ts               # Main extension code
├── syntaxes/
│   └── templ.tmLanguage.json      # Syntax grammar
├── snippets/
│   └── templ.json                 # Code snippets
├── themes/
│   └── templ-dark-color-theme.json # Dark theme
├── icons/
│   ├── templ-light.svg            # Light theme icon
│   └── templ-dark.svg             # Dark theme icon
├── example.templ                  # Example templ file
├── README.md                      # This file
├── CHANGELOG.md                   # Version history
├── LICENSE                        # MIT License
└── .gitignore                     # Git ignore rules
```

## Known Issues

- Formatting is basic and may need improvement for complex templ files
- Some edge cases in syntax highlighting may not be perfectly handled

## Building from Source

If you want to build this extension from source:

1. **Clone the repository:**
   ```bash
   git clone https://github.com/noruj-official/templ-syntax-highlight.git
   cd templ-syntax-highlight
   ```

2. **Install dependencies:**
   ```bash
   npm install
   ```

3. **Compile the extension:**
   ```bash
   npm run compile
   ```

4. **Package the extension:**
   ```bash
   npx vsce package
   ```

This will create a `.vsix` file that you can install manually.

## Contributing

Contributions are welcome! Please feel free to submit issues or pull requests.

## License

This extension is licensed under the MIT License.

## Extension Status

This extension is published and available on:
- **VS Code Marketplace**: Search for "Templ Syntax Highlight"
- **Open VSX Registry**: Available at [open-vsx.org](https://open-vsx.org/extension/shaik-noor/templ-syntax-highlight)
- **GitHub**: Source code and releases at [noruj-official/templ-syntax-highlight](https://github.com/noruj-official/templ-syntax-highlight)

## Links

- [templ Documentation](https://templ.guide) - Official templ documentation
- [templ GitHub](https://github.com/a-h/templ) - templ source code
- [VS Code Extension API](https://code.visualstudio.com/api) - VS Code extension development
- [VS Code Marketplace](https://marketplace.visualstudio.com/items?itemName=shaik-noor.templ-syntax-highlight) - Extension marketplace page
- [Open VSX Registry](https://open-vsx.org/extension/shaik-noor/templ-syntax-highlight) - Open VSX extension page

## Support

If you encounter any issues or have feature requests, please create an issue on the GitHub repository.