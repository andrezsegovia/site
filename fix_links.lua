-- Function to rewrite URLs based on your rules
function rewrite_url(url)
    -- Ignore external links (starting with http or https)
    if url:match("^https?://") then
        return url
    end

    -- Rules for links pointing to the "assets" folder
    if url:match("[%.%./]*assets/") then
        return url:gsub("^[%.%./]*assets/", "/andrezsegovia/assets/")
    else
        local new_target = url:gsub("%.md$", ".html")
        -- Rules for other internal links
        return new_target:gsub("^[%.%./]*", "/andrezsegovia/")
    end
end

-- Process <a href=""> (Hyperlinks)
function Link(el)
    el.target = rewrite_url(el.target)
    return el
end

-- Process <img src="">, <audio src="">, <video src="">, <source src="">, <track src="">, <iframe src="">, <embed src="">, <object data="">
function Image(el)
    el.src = rewrite_url(el.src)
    return el
end

function RawBlock(el)
    -- Modify URLs inside raw HTML blocks
    local modified_text = el.text:gsub('(href|src|data|action|formaction)="([^"]+)"', function(attr, url)
        return attr .. '="' .. rewrite_url(url) .. '"'
    end)
    
    return pandoc.RawBlock(el.format, modified_text)
end
