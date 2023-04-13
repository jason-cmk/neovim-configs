vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format({async = false, timeout_ms = 10000}) end)
