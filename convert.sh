#!/bin/bash

# Remove and recreate the dist directory to ensure a clean build
rm -rf dist
mkdir -p dist

# Copy the assets folder into dist/
cp -r assets dist/

# Find all .md files except README.md and process them
find . -name "*.md" ! -name "README.md" | while read file; do
    output="${file%.md}.html"

    # Convert .md files to .html in the dist/ folder
    output="dist/${output#./}"
    mkdir -p "$(dirname "$output")"  # Create necessary subdirectories

    # Run pandoc with the Lua filter
    pandoc --lua-filter=fix_links.lua --template=template.html "$file" -o "$output"
done

echo "Conversion completed: Markdown files converted to HTML in the dist/ folder."
echo "Assets folder copied to dist/."
