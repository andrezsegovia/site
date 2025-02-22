#!/bin/bash

# Clean up the dist folder before conversion
rm -rf dist
mkdir -p dist

# Recursively find all .md files except README.md
find . -type f -name "*.md" ! -name "README.md" | while read file; do
    output="dist/${file%.md}.html"

    # Create necessary directories
    mkdir -p "$(dirname "$output")"

    # Convert markdown to HTML using Pandoc and apply fix_links.lua
    pandoc "$file" --lua-filter=fix_links.lua --template=template.html -o "$output"
done

echo "Conversion completed: Markdown files converted to HTML in the dist/ folder."

# Copy the assets folder to dist
cp -r assets dist/

echo "Assets folder copied to dist/."
