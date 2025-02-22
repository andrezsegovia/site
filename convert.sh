#!/bin/bash

# Ensure the src directory exists
mkdir -p src

# Find all .md files and process them
find . -name "*.md" | while read file; do
    output="${file%.md}.html"

    if [[ "$file" == "./index.md" ]]; then
        # Convert index.md to index.html in root and apply the Lua filter
        pandoc --lua-filter=fix_links.lua --template=template.html "$file" -o "$output"
    else
        # Convert other .md files and move them to src/, keeping the structure
        output="src/${output#./}"
        mkdir -p "$(dirname "$output")"  # Create necessary subdirectories
        pandoc --lua-filter=fix_links.lua --template=template.html "$file" -o "$output"
    fi
done

echo "Markdown files converted to HTML successfully!"

