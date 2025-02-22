function Link(el)
    if el.target:match("%.md$") and not el.target:match("^https?://") then
        -- Convert .md links to .html and prepend "src/"
        local new_target = el.target:gsub("%.md$", ".html") -- Change .md to .html

        -- Ensure "src/" is added unless it's already there
        if not new_target:match("^src/") then
            new_target = "src/" .. new_target
        end

        el.target = new_target
    end
    return el
end

