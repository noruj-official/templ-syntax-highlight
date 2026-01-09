import * as vscode from 'vscode';

export function activate(context: vscode.ExtensionContext) {
    console.log('Templ Syntax Highlight extension is now active!');

    // Register language provider for templ files
    const templLanguageProvider = vscode.languages.registerCompletionItemProvider(
        'templ',
        {
            provideCompletionItems(document: vscode.TextDocument, position: vscode.Position) {
                const completions: vscode.CompletionItem[] = [];

                // Add templ-specific completions
                const templKeywords = [
                    'component',
                    'css',
                    'script',
                    'if',
                    'else',
                    'for',
                    'switch',
                    'case',
                    'default'
                ];

                templKeywords.forEach(keyword => {
                    const item = new vscode.CompletionItem(keyword, vscode.CompletionItemKind.Keyword);
                    item.detail = 'Templ keyword';
                    completions.push(item);
                });

                // Add common HTML tags
                const htmlTags = [
                    'div', 'span', 'p', 'h1', 'h2', 'h3', 'h4', 'h5', 'h6',
                    'a', 'img', 'button', 'input', 'form', 'label', 'textarea',
                    'select', 'option', 'ul', 'ol', 'li', 'table', 'tr', 'td', 'th'
                ];

                htmlTags.forEach(tag => {
                    const item = new vscode.CompletionItem(tag, vscode.CompletionItemKind.Property);
                    item.detail = 'HTML tag';
                    completions.push(item);
                });

                return completions;
            }
        },
        '<', ' ', '{'
    );

    // Register hover provider
    const hoverProvider = vscode.languages.registerHoverProvider('templ', {
        provideHover(document: vscode.TextDocument, position: vscode.Position) {
            const range = document.getWordRangeAtPosition(position);
            const word = document.getText(range);

            if (word === 'component') {
                return new vscode.Hover(
                    new vscode.MarkdownString(
                        `**Templ Component**\n\nDefines a new templ component.\n\n` +
                        `Usage: \`component ComponentName(params) { ... }\``
                    )
                );
            }

            if (word === 'css') {
                return new vscode.Hover(
                    new vscode.MarkdownString(
                        `**Templ CSS Block**\n\nEmbeds CSS styles within a templ component.\n\n` +
                        `Usage: \`css { ... }\``
                    )
                );
            }

            if (word === 'script') {
                return new vscode.Hover(
                    new vscode.MarkdownString(
                        `**Templ Script Block**\n\nEmbeds JavaScript within a templ component.\n\n` +
                        `Usage: \`script { ... }\``
                    )
                );
            }

            return undefined;
        }
    });

    // Register document formatting provider
    const formattingProvider = vscode.languages.registerDocumentFormattingEditProvider('templ', {
        provideDocumentFormattingEdits(document: vscode.TextDocument): vscode.TextEdit[] {
            const edits: vscode.TextEdit[] = [];
            const text = document.getText();
            const lines = text.split('\n');

            let indentLevel = 0;
            const indentSize = vscode.workspace.getConfiguration('editor').get('tabSize', 2);
            const useSpaces = vscode.workspace.getConfiguration('editor').get('insertSpaces', true);
            const indent = useSpaces ? ' '.repeat(indentSize) : '\t';

            for (let i = 0; i < lines.length; i++) {
                const line = lines[i].trim();
                
                // Skip empty lines
                if (!line) continue;

                // Decrease indent for closing tags and blocks
                if (line.startsWith('</') || 
                    line.startsWith('}') || 
                    line.match(/^(else|case|default)\b/)) {
                    indentLevel = Math.max(0, indentLevel - 1);
                }

                const formattedLine = indent.repeat(indentLevel) + line;
                const range = new vscode.Range(i, 0, i, lines[i].length);
                edits.push(new vscode.TextEdit(range, formattedLine));

                // Increase indent for opening tags and blocks
                if (line.match(/^<[^/][^>]*>/) && !line.match(/\/>$/)) {
                    indentLevel++;
                } else if (line.endsWith('{') && !line.startsWith('//')) {
                    indentLevel++;
                }
            }

            return edits;
        }
    });

    // Add status bar item
    const statusBarItem = vscode.window.createStatusBarItem(vscode.StatusBarAlignment.Right, 100);
    statusBarItem.text = "$(symbol-namespace) Templ";
    statusBarItem.tooltip = "Templ Syntax Highlight Active";
    statusBarItem.show();

    // Add command to show templ info
    const showInfoCommand = vscode.commands.registerCommand('templ.showInfo', () => {
        vscode.window.showInformationMessage(
            'Templ Syntax Highlight v1.0.0 - Provides syntax highlighting for .templ files',
            'View Documentation',
            'Report Issue'
        ).then(selection => {
            if (selection === 'View Documentation') {
                vscode.env.openExternal(vscode.Uri.parse('https://templ.guide'));
            } else if (selection === 'Report Issue') {
                vscode.env.openExternal(vscode.Uri.parse('https://github.com/your-username/templ-syntax-highlight/issues'));
            }
        });
    });

    // Add command palette command
    vscode.commands.executeCommand('setContext', 'templExtensionActive', true);

    context.subscriptions.push(
        templLanguageProvider,
        hoverProvider,
        formattingProvider,
        statusBarItem,
        showInfoCommand
    );
}

export function deactivate() {
    console.log('Templ Syntax Highlight extension is now deactivated!');
}