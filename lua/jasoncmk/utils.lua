local M = {}

M.get_os = function()
    local fileSystemSeparator = package.config:sub(1, 1)

    if fileSystemSeparator == '/' then
        return 'unix'
    elseif fileSystemSeparator == '\\' then
        return 'windows'
    else
        error("could not determine OS!")
    end
end

return M
