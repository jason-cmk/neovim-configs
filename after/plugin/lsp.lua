-- Run neodev before LSP setup
require('neodev').setup({
    library = {
        plugins = { 'nvim-dap-ui' },
        types = true
    }
})

local lsp = require('lsp-zero')
local cmp = require('cmp')

lsp.defaults.cmp_mappings({
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
})

lsp.preset('recommended')
lsp.on_attach(function(_, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader>vs', vim.lsp.buf.workspace_symbol, opts)
    vim.keymap.set('n', '<leader>vd', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '<leader>jd', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<leader>kd', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', '<leader>vca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>vrr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>vrn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>vt', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})
