vim.g.mapleader = " "

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
vim.keymap.set("n", "x", [["_x]])

-- Window resizing
vim.keymap.set({ "n" }, "<A-h>", "<cmd>vertical resize -10<CR>", { desc = "Decrement window size horizontally" })
vim.keymap.set({ "n" }, "<A-l>", "<cmd>vertical resize +10<CR>", { desc = "Increment window size horizontally" })
vim.keymap.set({ "n" }, "<A-j>", "<cmd>horizontal resize -3<CR>",
    { desc = "Decrement window size vertical" })
vim.keymap.set({ "n" }, "<A-k>", "<cmd>horizontal resize +3<CR>",
    { desc = "Decrement window size vertical" })
