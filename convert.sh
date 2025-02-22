#!/bin/bash

# Ensure the dist directory exists
mkdir -p dist

# Find all .md files except README.md and process them
find . -name "*.md" ! -name "README.md" | while read file; do
    output="${file%.md}.html"

    # Convert .md files to .html in the dist/ folder
    output="dist/${output#./}"
    mkdir -p "$(dirname "$output")"  # Create necessary subdirectories

    # Run pandoc with the Lua filter
    pandoc --lua-filter=fix_links.lua --template=template.html "$file" -o "$output"
done

echo "Markdown files converted to HTML successfully in the dist/ folder, excluding README.md!"
