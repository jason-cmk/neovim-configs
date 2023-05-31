require('toggleterm').setup {
    direction = 'vertical',
    size = 75,
    open_mapping = '<leader>tm',
    shell = "powershell"
}

-- Never map leader key in insert mode
vim.keymap.del('i', '<leader>tm')
