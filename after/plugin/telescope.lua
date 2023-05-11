local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = '[P]roject [f]ind' })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Find git files' })
vim.keymap.set('n', '<leader>ps', builtin.live_grep, { desc = '[P]roject [s]earch' })
vim.keymap.set('n', '<leader>bl', builtin.buffers, { desc = '[B]uffer [l]ist' })
vim.keymap.set('n', '<leader>hh', builtin.help_tags, { desc = '[h][h]elp' })

vim.keymap.set('n', '<leader>bs', function()
    builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, { desc = '[/] Fuzzy [b]uffer [s]earch' })
