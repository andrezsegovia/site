function Link(el)
    if el.target:match("%.md$") and not el.target:match("^https?://") then
        -- Convert .md links to .html
        local new_target = el.target:gsub("%.md$", ".html") 

        -- Only prepend "dist/" if the link is not already relative (e.g., "../folder/file.md")
        if not new_target:match("^%.%.?/") then
            new_target = "dist/" .. new_target
        end

        el.target = new_target
    end
    return el
end
