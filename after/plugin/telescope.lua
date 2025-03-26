local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = '[P]roject [f]ind' })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Find git files' })
vim.keymap.set('n', '<leader>ps', builtin.live_grep, { desc = '[P]roject [s]earch' })
vim.keymap.set('n', '<leader>lb', builtin.buffers, { desc = '[L]ist [B]uffer' })
vim.keymap.set('n', '<leader>hh', builtin.help_tags, { desc = '[h][h]elp' })
vim.keymap.set('n', '<leader>rr', builtin.lsp_references, { desc = '[R]efe[r]ences' })
vim.keymap.set('n', '<leader>ws', builtin.lsp_workspace_symbols, { desc = '[W]orkspace [s]ymbols' })
vim.keymap.set('n', '<leader>gd', builtin.lsp_definitions, { desc = '[G]o to [d]efinitions' })
vim.keymap.set('n', '<leader>gi', builtin.lsp_implementations, { desc = '[G]o to [i]mplementations' })
vim.keymap.set('n', '<leader>gt', builtin.lsp_type_definitions, { desc = '[G]o to [t]ype definitions' })

vim.keymap.set('n', '<leader>sp', function()
    builtin.spell_suggest(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, { desc = 'Fuzzy [sp]elling suggestions' })

vim.keymap.set('n', '<leader>sb', function()
    builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, { desc = 'Fuzzy [s]earch [b]uffer' })


local telescope = require("telescope")

telescope.load_extension("git_worktree")

vim.keymap.set('n', '<leader>wt', telescope.extensions.git_worktree.git_worktrees,
    { desc = 'git_worktree [W]ork[t]rees' })

vim.api.nvim_create_user_command('Worktree', function()
    telescope.extensions.git_worktree.create_git_worktree()
end, {})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "TelescopeResults",
    callback = function(ctx)
        vim.api.nvim_buf_call(ctx.buf, function()
            vim.fn.matchadd("TelescopeParent", "\t\t.*$")
            vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
        end)
    end,
})

local function filenameFirst(_, path)
    local tail = vim.fs.basename(path)
    local parent = vim.fs.dirname(path)
    if parent == "." then return tail end
    return string.format("%s\t\t%s", tail, parent)
end

telescope.setup {
    pickers = {
        find_files = {
            path_display = filenameFirst
        },
        lsp_references = {
            path_display = filenameFirst
        }
    }
}
