#!/bin/bash

# CheatSheet Generator Script
# Usage: ./generate.sh "Topic Name"

set -e

if [ -z "$1" ]; then
    echo "Usage: ./generate.sh \"Topic Name\""
    echo "Example: ./generate.sh \"Python Basics\""
    exit 1
fi

TOPIC="$1"
FOLDER_NAME=$(echo "$TOPIC" | tr '[:upper:]' '[:lower:]' | tr ' ' '-')

echo "📄 Creating cheat sheet for: $TOPIC"
echo "📁 Folder: $FOLDER_NAME"

# Create project directory
mkdir -p "$FOLDER_NAME"
cd "$FOLDER_NAME"

# Copy template files
cp ../template/cheatsheet.tex ./
cp ../template/Makefile ./
cp ../template/.latexmkrc ./
cp ../template/.gitignore ./

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
