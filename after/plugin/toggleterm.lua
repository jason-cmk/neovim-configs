require('toggleterm').setup {
    direction = 'vertical',
    size = 50,
    open_mapping = '<leader>tm'
}

-- Never map leader key in insert mode
vim.keymap.del('i', '<leader>tm')
