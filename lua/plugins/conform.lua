return {
    'stevearc/conform.nvim',
    opts = {},
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                lua = { "lua-format" },
                javascript = { "prettierd", "prettier", stop_after_first = true },
                csharp = { "csharpier" },
            }
        })
    end
}
