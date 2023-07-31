local mark = require('harpoon.mark')
local ui = require('harpoon.ui')
local harpoon = require('harpoon')
local utils = require('jasoncmk.utils')

harpoon.setup({
    tabline = true,
})

vim.keymap.set('n', '<leader>a', function()
    local buffName = vim.api.nvim_buf_get_name(0)

    if utils.get_os() == 'windows' then
        -- Uppercase the root drive e.g. "c:" -> "C:"
        local root = string.upper(string.sub(buffName, 0, 1))

        buffName = root .. string.sub(buffName, 2, -1)

        buffName = buffName:gsub('/', '\\')
    end

    mark.add_file(buffName)
end)

vim.keymap.set('n', '<leader>e', ui.toggle_quick_menu)

vim.keymap.set('n', '<C-h>', function() ui.nav_file(1) end)
vim.keymap.set('n', '<C-j>', function() ui.nav_file(2) end)
vim.keymap.set('n', '<C-k>', function() ui.nav_file(3) end)
vim.keymap.set('n', '<C-l>', function() ui.nav_file(4) end)
