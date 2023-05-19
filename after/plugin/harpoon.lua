local mark = require('harpoon.mark')
local ui = require('harpoon.ui')
local harpoon = require('harpoon')

harpoon.setup({
    tabline = true,
})

-- quickfix the list of marks to fix the issues with tab highlighting when restarting neovim
mark.to_quickfix_list()

local update_tabs = function()
    vim.cmd('redrawtabline')
end

update_tabs()

mark.on("changed", update_tabs)

vim.keymap.set('n', '<leader>a', mark.add_file)

vim.keymap.set('n', '<leader>e', ui.toggle_quick_menu)

vim.keymap.set('n', '<C-h>', function() ui.nav_file(1) end)
vim.keymap.set('n', '<C-j>', function() ui.nav_file(2) end)
vim.keymap.set('n', '<C-k>', function() ui.nav_file(3) end)
vim.keymap.set('n', '<C-l>', function() ui.nav_file(4) end)
