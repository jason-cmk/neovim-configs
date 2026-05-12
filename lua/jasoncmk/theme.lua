-- Single source of truth for the active colorscheme + lualine theme.
-- Picks light or dark based on the LIGHT_SWITCH env var:
--   on  (default) -> light theme
--   off           -> dark theme
--
-- Each mode is a self-contained table with:
--   colorscheme  -- name passed to vim.cmd.colorscheme
--   lualine      -- name passed to require("lualine").setup({ options = { theme = ... } })
--   apply        -- function that calls the plugin's setup() and any per-mode highlight tweaks
--
-- To swap dark mode to a different theme entirely (e.g. dracula, gruvbox),
-- replace the `dark = ...` assignment with a table of the same shape.

local M = {}

local switch = (vim.env.LIGHT_SWITCH or "on"):lower()
M.is_dark = switch == "off"

local function catppuccin(flavour)
    return {
        colorscheme = "catppuccin-" .. flavour,
        lualine = "catppuccin-" .. flavour,
        apply = function()
            require("catppuccin").setup({
                flavour = flavour,
                highlight_overrides = {
                    all = function(colors)
                        return {
                            Visual = { bg = '#8f4248' },
                            ["@comment"] = { fg = colors.green, style = { "italic" } },
                        }
                    end
                },
                term_colors = true,
            })
            vim.cmd.colorscheme("catppuccin-" .. flavour)

            vim.defer_fn(function()
                local palette = require("catppuccin.palettes").get_palette(flavour)
                vim.api.nvim_set_hl(0, 'Normal', { bg = palette.none })
                vim.api.nvim_set_hl(0, 'NormalFloat', { bg = palette.none })
                vim.api.nvim_set_hl(0, 'Cursor', { bg = palette.rosewater })
                vim.api.nvim_set_hl(0, 'Visual', { bg = palette.surface1 })
            end, 0)
        end,
    }
end

local light = catppuccin("latte")
local dark = catppuccin("mocha")

-- Example: to use dracula for dark instead, install the plugin in plugins.lua
-- and replace the line above with:
--   local dark = {
--     colorscheme = "dracula",
--     lualine     = "dracula",
--     apply       = function() vim.cmd.colorscheme("dracula") end,
--   }

local active = M.is_dark and dark or light
M.colorscheme = active.colorscheme
M.lualine = active.lualine
M.apply = active.apply

return M
