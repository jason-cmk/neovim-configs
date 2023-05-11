vim.api.nvim_command('highlight Cursor guifg=white guibg=black')
vim.api.nvim_command('highlight iCursor guifg=white guibg=steelblue')
vim.api.nvim_command('set guicursor=a:block-Cursor-blinkon1,i:ver1-iCursor-blinkon1')
vim.opt.relativenumber = true
vim.opt.nu = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smarttab = true

vim.opt.wrap = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.g.mapleader = " "

vim.opt.splitbelow = true
vim.opt.splitright = true
