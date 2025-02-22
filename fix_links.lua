function rewrite_url(url)
    if url:match("^https?://") then
        -- Do not modify external links
        return url
    elseif url:match("^/assets/") or url:match("^[.]+/assets/") then
        -- Convert all assets references to absolute paths with /andrezsegovia/
        return "/andrezsegovia/assets/" .. url:gsub("^.*/assets/", "")
    else
        -- Convert all other internal links to absolute paths with /andrezsegovia/
        return "/andrezsegovia/" .. url:gsub("^.*/", "")
    end
end

function process_attribute(el, attr)
    if el[attr] then
        el[attr] = rewrite_url(el[attr])
    end
end

function Link(el)
    el.target = rewrite_url(el.target)
    return el
end

function Image(el)
    el.src = rewrite_url(el.src)
    return el
end

function Meta(el)
    process_attribute(el, "content")
    return el
end

function Inline(el)
    process_attribute(el, "src")
    process_attribute(el, "href")
    return el
end

function Div(el)
    process_attribute(el, "src")
    process_attribute(el, "href")
    return el
end
