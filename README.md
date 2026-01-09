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

1. Install the extension from the VS Code marketplace
2. Open any `.templ` file to activate the syntax highlighting

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

1. Clone the repository
2. Install dependencies: `npm install`
3. Make your changes
4. Compile: `npm run compile`
5. Test in VS Code by pressing `F5` to open a new Extension Development Host window

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
└── README.md                      # This file
```

## Known Issues

- Formatting is basic and may need improvement for complex templ files
- Some edge cases in syntax highlighting may not be perfectly handled

## Publishing

To publish this extension to VS Code Marketplace and Open VSX:

1. **Install publishing tools:**
   ```bash
   npm install -g vsce ovsx
   ```

2. **Create publisher accounts:**
   - [VS Code Marketplace](https://marketplace.visualstudio.com/manage)
   - [Open VSX Registry](https://open-vsx.org/)

3. **Publish using the automated script:**
   ```bash
   # On Windows
   publish.bat
   
   # On macOS/Linux
   ./publish.sh
   ```

4. **Or publish manually:**
   ```bash
   # Package the extension
   vsce package
   
   # Publish to Microsoft Marketplace
   vsce publish
   
   # Publish to Open VSX
   ovsx publish
   ```

For detailed publishing instructions, see [PUBLISHING.md](PUBLISHING.md).

## Contributing

Contributions are welcome! Please feel free to submit issues or pull requests.

## License

This extension is licensed under the MIT License.

## Links

- [templ Documentation](https://templ.guide)
- [templ GitHub](https://github.com/a-h/templ)
- [VS Code Extension API](https://code.visualstudio.com/api)

## Support

If you encounter any issues or have feature requests, please create an issue on the GitHub repository.