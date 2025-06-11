vim.keymap.set('i', '<leader><CR>', 'copilot#Accept("\\<CR>")', {
    expr = true,
    replace_keycodes = false,
    silent = true,
})
