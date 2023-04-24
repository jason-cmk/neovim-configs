require("catppuccin").setup({
    flavour = "mocha",
    highlight_overrides = {
        all = function(colors)
            return {
                Visual = { bg = colors.surface0 }
            }
        end
    }
})

vim.cmd.colorscheme "catppuccin"

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = '#d4b455', bold = true })
vim.api.nvim_set_hl(0, 'LineNr', { fg = '#FB508F', bold = true })
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = '#d4b455', bold = true })
