# CheatSheet Template 📄

A flexible LaTeX template for creating beautiful two-column cheat sheets for any topic - programming languages, books, courses, or study notes.

## ✨ Features

- 📐 **Two-column A4 layout** - Maximum information density
- 🎨 **Syntax highlighting** - Beautiful code blocks
- 🔧 **Easy customization** - Simple template system
- ⚡ **Quick generation** - One command to create new sheets
- 🔄 **Auto-build** - LaTeX Workshop integration for VS Code
- 🔗 **SyncTeX support** - PDF ↔ code synchronization

## 🚀 Quick Start

### 1. Clone the Template

```bash
git clone https://github.com/yavuzelcil/CheatSheetTemplate.git
cd CheatSheetTemplate
```

### 2. Generate a New Cheat Sheet

```bash
chmod +x generate.sh
./generate.sh "Python Basics"
```

This will create a new folder `python-basics/` with all necessary files.

**💡 Create in a custom directory:**
```bash
# Create in a specific directory
./generate.sh "Python Basics" ~/Documents/cheatsheets

# Create in a relative path
./generate.sh "JavaScript ES6" ./my-cheatsheets
```

### 3. Edit and Build

```bash
cd python-basics
make pdf
```

Open `cheatsheet.pdf` to see your result!

## 📝 Usage Examples

```bash
# Create cheat sheets for different topics
./generate.sh "JavaScript ES6"
./generate.sh "SQL Queries"
./generate.sh "Git Commands"
./generate.sh "Linear Algebra"
./generate.sh "Book: Clean Code"

# Create in custom locations
./generate.sh "React Hooks" ~/Documents/dev-notes
./generate.sh "Docker Commands" /Users/username/Projects/cheatsheets
```

## 📂 What Gets Generated

```
your-topic/
├── cheatsheet.tex      # Main LaTeX source (edit this!)
├── Makefile           # Build automation
├── .latexmkrc         # LaTeX configuration
├── .gitignore         # Git ignore rules
└── README.md          # Project-specific README
```

## ✏️ Editing Your Cheat Sheet

1. Open `cheatsheet.tex` in your favorite editor
2. Replace placeholder content with your notes
3. Use the `Code` environment for code blocks:

```latex
\begin{Code}
def example():
    print("Your code here")
\end{Code}
```

4. Save and run `make pdf` to rebuild

## 🎨 Template Placeholders

The generator automatically replaces:
- `{{TOPIC}}` - Your topic name (e.g., "Python Basics")
- `{{TOPIC_LOWER}}` - Lowercase slug (e.g., "python-basics")

## 🛠️ Requirements

- **LaTeX**: `xelatex`, `pdflatex`, or `tectonic`
- **Build tool**: `latexmk` (recommended) or `make`

### Installation (macOS)

```bash
brew install --cask mactex
```

### Installation (Linux)

```bash
sudo apt-get install texlive-full
```

## 📋 Build Commands

```bash
make pdf          # Generate PDF
make clean        # Remove auxiliary files
make distclean    # Remove all generated files including PDF
```

## 🎯 Tips

- Keep sections short and focused
- Use bullet points for quick reference
- Add code examples with proper syntax
- Use subsections to organize content
- Leverage the two-column layout for comparisons

## 🤝 Contributing

Contributions welcome! Ideas for improvements:
- Additional LaTeX packages
- New color schemes
- Language-specific templates
- Enhanced code highlighting

## 📄 License

This template is open source. Use it for anything!

## 🌟 Example Projects

See these cheat sheets created with this template:
- [MyRsCheatSheet](https://github.com/yavuzelcil/MyRsCheatSheet) - Rust programming language

## 💡 Inspiration

Perfect for:
- 📚 Study notes
- 💻 Programming language references
- 📖 Book summaries
- 🎓 Course materials
- 🔍 Quick reference guides
- 📝 Meeting notes

---

**Created by**: Yavuz Elcil  
**Built with**: LaTeX, TikZ, and ❤️
