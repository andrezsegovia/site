function Link(el)
    -- Fix internal Markdown links (convert .md to .html)
    if el.target:match("%.md$") and not el.target:match("^https?://") then
        local new_target = el.target:gsub("%.md$", ".html")

        -- Only prepend "dist/" if the link is not already relative
        if not new_target:match("^%.%.?/") then
            new_target = "dist/" .. new_target
        end

        el.target = new_target
    end

    -- Fix absolute references to assets (e.g., "/assets/img.png" → "../assets/img.png")
    if el.target:match("^/assets/") then
        el.target = ".." .. el.target  -- Ensure correct relative path from `dist/`
    end

    -- Fix relative references to assets (adjusting depth)
    if el.target:match("assets/") and not el.target:match("^https?://") then
        local depth = 0
        for _ in el.target:gmatch("%.%.?/") do
            depth = depth + 1
        end

        -- Generate the correct relative path
        local prefix = ("../"):rep(depth)
        el.target = prefix .. el.target
    end

    return el
end
