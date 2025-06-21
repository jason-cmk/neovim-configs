local harpoon = require("harpoon")

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>e", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end)

---@class Config
---@field tab_prefix? string
---@field tab_suffix? string
---@field use_editor_color_scheme? boolean
---@field empty_label? string
---@field show_empty? boolean
---@field format_item_names? (fun(list: {value: any}): string[])
local config = {
    tab_prefix = " ",
    tab_suffix = " ",
    use_editor_color_scheme = true,
    empty_label = "(empty)",
    show_empty = true,
}
require('harpoon-tabline').setup(config)
