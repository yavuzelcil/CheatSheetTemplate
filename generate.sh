#!/bin/bash

# CheatSheet Generator Script
# Usage: ./generate.sh "Topic Name" [output_directory]

set -e

if [ -z "$1" ]; then
    echo "Usage: ./generate.sh \"Topic Name\" [output_directory]"
    echo "Example: ./generate.sh \"Python Basics\""
    echo "Example: ./generate.sh \"Python Basics\" ~/Documents/cheatsheets"
    exit 1
fi

TOPIC="$1"
FOLDER_NAME=$(echo "$TOPIC" | tr '[:upper:]' '[:lower:]' | tr ' ' '-')

# Determine output directory
if [ -z "$2" ]; then
    OUTPUT_DIR="$FOLDER_NAME"
else
    # Create absolute path if relative path is given
    if [[ "$2" = /* ]]; then
        OUTPUT_DIR="$2/$FOLDER_NAME"
    else
        OUTPUT_DIR="$(pwd)/$2/$FOLDER_NAME"
    fi
fi

echo "📄 Creating cheat sheet for: $TOPIC"
echo "📁 Output directory: $OUTPUT_DIR"

# Store the template directory path
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TEMPLATE_DIR="$SCRIPT_DIR/template"

# Create project directory
mkdir -p "$OUTPUT_DIR"
cd "$OUTPUT_DIR"

# Copy template files
cp "$TEMPLATE_DIR/cheatsheet.tex" ./
cp "$TEMPLATE_DIR/Makefile" ./
if [ -f "$TEMPLATE_DIR/.latexmkrc" ]; then
    cp "$TEMPLATE_DIR/.latexmkrc" ./
fi
if [ -f "$TEMPLATE_DIR/.gitignore" ]; then
    cp "$TEMPLATE_DIR/.gitignore" ./
fi

# Replace placeholders in template
sed -i.bak "s/{{TOPIC}}/$TOPIC/g" cheatsheet.tex
sed -i.bak "s/{{TOPIC_LOWER}}/$FOLDER_NAME/g" cheatsheet.tex
rm *.bak

# Create README
cat > README.md << EOF
# $TOPIC Cheat Sheet

A comprehensive $TOPIC reference guide in LaTeX format.

## Quick Start

\`\`\`bash
make pdf          # Generate cheatsheet.pdf
make clean        # Clean auxiliary files
\`\`\`

## Edit

Edit \`cheatsheet.tex\` to add your content.

## Structure

- Two-column A4 layout
- 8pt font for maximum density
- Auto line-breaking for code blocks
- SyncTeX support for PDF-code sync

---
Generated with [CheatSheetTemplate](https://github.com/yavuzelcil/CheatSheetTemplate)
EOF

# Initialize git
git init
git add .
git commit -m "Initial commit: $TOPIC cheat sheet"

echo ""
echo "✅ Done! Your cheat sheet is ready at: $FOLDER_NAME/"
echo ""
echo "Next steps:"
echo "  cd $FOLDER_NAME"
echo "  make pdf"
echo ""
