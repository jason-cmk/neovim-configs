-- Specify how the border looks like
local border = {
    { '┌', 'FloatBorder' },
    { '─', 'FloatBorder' },
    { '┐', 'FloatBorder' },
    { '│', 'FloatBorder' },
    { '┘', 'FloatBorder' },
    { '─', 'FloatBorder' },
    { '└', 'FloatBorder' },
    { '│', 'FloatBorder' },
}

-- To instead override globally
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or border
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

local opts = {
    remap = false,
}

vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
vim.keymap.set('n', '<leader>vd', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '<leader>vca', vim.lsp.buf.code_action, opts)
vim.keymap.set('n', '<leader>vrn', vim.lsp.buf.rename, opts)
vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, opts)
vim.keymap.set('n', '<leader>vs', vim.lsp.buf.signature_help, opts)
vim.keymap.set({ "n", "v" }, "<leader>f", function() vim.lsp.buf.format({ async = false, timeout_ms = 10000 }) end)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)

vim.keymap.set('n', '<leader>va', function()
    -- quick fix
    local quickFixable = {
        "using ",
        "Remove Unnecessary Usings",
        "Fix all prettier/prettier problems",
        "Fix this prettier/prettier problem",
    }

    vim.lsp.buf.code_action({
        filter = function(a)
            for _, qf in pairs(quickFixable) do
                if string.find(a.title, qf, 1) then
                    return true
                end
            end
            return false
        end,
        apply = true
    })
end, opts)

-- Autocomplete
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        if client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
        end
    end,
})

-- Inlay hints
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        if client:supports_method('textDocument/inlayHint') then
            vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
        end
    end,
})

-- Highlight
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        if client and client:supports_method('textDocument/documentHighlight') then
            local autocmd = vim.api.nvim_create_autocmd
            local augroup = vim.api.nvim_create_augroup('lsp_highlight', { clear = false })

            vim.api.nvim_clear_autocmds({ buffer = bufnr, group = augroup })

            autocmd({ 'CursorHold' }, {
                group = augroup,
                buffer = args.buf,
                callback = vim.lsp.buf.document_highlight,
            })

            autocmd({ 'CursorMoved' }, {
                group = augroup,
                buffer = args.buf,
                callback = vim.lsp.buf.clear_references,
            })
        end
    end,
})

vim.diagnostic.config({
    virtual_text = true
})

-- Enable
vim.lsp.enable({
    'lua_ls',
    'csharp_ls',
    'csformat',
    'eslint',
    'dockerls',
    'docker_compose_language_service',
    'jedi_language_server',
    'cssls',
    'css_variables',
    'ts_ls',
    'bashls',
    'jsonls',
    'prettier',
})
