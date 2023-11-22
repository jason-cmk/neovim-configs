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

local on_attach = function(_, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader>vd', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '<leader>jd', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<leader>kd', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', '<leader>vca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>vrn', vim.lsp.buf.rename, opts)
    vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<leader>vs', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<leader>va', function()

        vim.diagnostic.goto_next()

        -- quick fix
        local quickFixable = {
            "using ",
            "Remove Unnecessary Usings"
        }

        vim.lsp.buf.code_action({
            filter = function(a)
                for _, qf in pairs(quickFixable) do
                    if string.find(a.title, qf, 1) then
                        return true
                    end
                end
            end,
            apply = true
        })
    end, opts)
end

lsp.on_attach(on_attach)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})

-- Try to attach to buffer 0
vim.api.nvim_create_user_command('LspX', function()
    local client = vim.lsp.get_active_clients()[0]

    if client == nil then
        print 'No active clients'
    else
        vim.lsp.buf_attach_client(0, client.id)
    end
end, {})
