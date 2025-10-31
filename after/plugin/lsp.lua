vim.lsp.util.open_floating_preview = (function()
    local original_open_floating_preview = vim.lsp.util.open_floating_preview

    return function(contents, syntax, opts, ...)
        opts = opts or {}

        -- Use a built-in border style but with custom highlights
        -- You can choose "single", "double", "rounded", "solid", or "shadow"
        opts.border = 'single'

        return original_open_floating_preview(contents, syntax, opts, ...)
    end
end)()

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

        if client and client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
        end
    end,
})

-- Inlay hints
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        if client and client:supports_method('textDocument/inlayHint') then
            vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
        end
    end,
})

vim.diagnostic.config({
    virtual_text = true
})


-- Jump to error diagnostics
local function goto_next_error()
    local errors = vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
    if #errors == 0 then
        vim.notify("No error diagnostics in buffer", vim.log.levels.INFO)
    else
        vim.diagnostic.goto_next({
            severity = vim.diagnostic.severity.ERROR,
            wrap = true, -- Wrap around when reaching the end of file
        })
    end
end

local function goto_prev_error()
    local errors = vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
    if #errors == 0 then
        vim.notify("No error diagnostics in buffer", vim.log.levels.INFO)
    else
        vim.diagnostic.goto_prev({
            severity = vim.diagnostic.severity.ERROR,
            wrap = true, -- Wrap around when reaching the beginning of file
        })
    end
end

vim.keymap.set('n', ']e', goto_next_error, {
    desc = 'Go to next error diagnostic',
    silent = true
})

vim.keymap.set('n', '[e', goto_prev_error, {
    desc = 'Go to previous error diagnostic',
    silent = true
})



-- Enable
vim.lsp.enable({
    'lua_ls',
    'csharp_ls',
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
    'superhtml',
})

-- for decompiling C# code
require("csharpls_extended").buf_read_cmd_bind()
