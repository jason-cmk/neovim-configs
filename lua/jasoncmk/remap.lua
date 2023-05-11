vim.g.mapleader = " "

vim.keymap.set({"n", "v"}, "<leader>pv", ":NvimTreeToggle<cr>", { desc = '[P]roject [v]iew explorer' })
vim.keymap.set({"n", "v"}, "<leader>f", function() vim.lsp.buf.format({ async = false, timeout_ms = 10000 }) end)

-- Move visual blocks
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- Keep cursor in place when using J command
vim.keymap.set("n", "J", "mzJ`z")
-- Keep cursor in middle when jumping up and down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- Keep cursor in middle when going through search results
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Paste without yanking
vim.keymap.set("n", "<leader>p", [["_dP]])

-- Copy to system clipboard
vim.keymap.set({ "n", "v" }, "y", [["+y]])
vim.keymap.set("n", "Y", [["+Y]])

-- Delete to the void
vim.keymap.set("n", "<leader>d", [["_d]])

-- Insert to start of line
vim.keymap.set({"n","v"}, "<leader>i", [[:s/^/]])

-- Window resizing
vim.keymap.set("n", "<leader>wh", "<cmd>vertical resize -10<CR>")
vim.keymap.set("n", "<leader>wl", "<cmd>vertical resize +10<CR>")
vim.keymap.set("n", "<leader>wj", "<cmd>horizontal resize -3<CR>")
vim.keymap.set("n", "<leader>wk", "<cmd>horizontal resize +3<CR>")
