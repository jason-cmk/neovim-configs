-- Catppuccin colours
-- Name             Latte      Frappe    Macchiato  Mocha      Usage
-- rosewater       #dc8a78    #F2D5CF    #F4DBD6    #F5E0DC    Winbar
-- flamingo        #DD7878    #EEBEBE    #F0C6C6    #F2CDCD    Target word
-- pink            #ea76cb    #F4B8E4    #F5BDE6    #F5C2E7    Just pink
-- mauve           #8839EF    #CA9EE6    #C6A0F6    #CBA6F7    Tag
-- red             #D20F39    #E78284    #ED8796    #F38BA8    Error
-- maroon          #E64553    #EA999C    #EE99A0    #EBA0AC    Lighter red
-- peach           #FE640B    #EF9F76    #F5A97F    #FAB387    Number
-- yellow          #df8e1d    #E5C890    #EED49F    #F9E2AF    Warning
-- green           #40A02B    #A6D189    #A6DA95    #A6E3A1    Diff add
-- teal            #179299    #81C8BE    #8BD5CA    #94E2D5    Hint
-- sky             #04A5E5    #99D1DB    #91D7E3    #89DCEB    Operator
-- sapphire        #209FB5    #85C1DC    #7DC4E4    #74C7EC    Constructor
-- blue            #1e66f5    #8CAAEE    #8AADF4    #89B4FA    Diff changed
-- lavender        #7287FD    #BABBF1    #B7BDF8    #B4BEFE    CursorLine Nr
-- text            #4C4F69    #c6d0f5    #CAD3F5    #CDD6F4    Default fg
-- subtext1        #5C5F77    #b5bfe2    #B8C0E0    #BAC2DE    Indicator
-- subtext0        #6C6F85    #a5adce    #A5ADCB    #A6ADC8    Float title
-- overlay2        #7C7F93    #949cbb    #939AB7    #9399B2    Popup fg
-- overlay1        #8C8FA1    #838ba7    #8087A2    #7F849C    Conceal color
-- overlay0        #9CA0B0    #737994    #6E738D    #6C7086    Fold color
-- surface2        #ACB0BE    #626880    #5B6078    #585B70    Default comment
-- surface1        #BCC0CC    #51576d    #494D64    #45475A    Darker comment
-- surface0        #CCD0DA    #414559    #363A4F    #313244    Darkest comment
-- base            #EFF1F5    #303446    #24273A    #1E1E2E    Default bg
-- mantle          #E6E9EF    #292C3C    #1E2030    #181825    Darker bg
-- crust           #DCE0E8    #232634    #181926    #11111B    Darkest bglllu

local flavour = "mocha"

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

vim.cmd.colorscheme "catppuccin"

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = '#d4b455', bold = true })
vim.api.nvim_set_hl(0, 'LineNr', { fg = '#FB508F', bold = true })
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = '#d4b455', bold = true })

local palette = require("catppuccin.palettes").get_palette(flavour)
local latte_palette = require("catppuccin.palettes").get_palette("latte")

vim.api.nvim_set_hl(0, 'HarpoonInactive', { bg = palette.base, fg = palette.subtext1 })
vim.api.nvim_set_hl(0, 'HarpoonActive', { bg = palette.pink, fg = palette.surface1, bold = true })
vim.api.nvim_set_hl(0, 'HarpoonNumberActive', { bg = palette.pink, fg = latte_palette.blue, bold = true })
vim.api.nvim_set_hl(0, 'HarpoonNumberInactive', { bg = palette.base, fg = palette.mauve })
vim.api.nvim_set_hl(0, 'TabLineFill', { fg = palette.base })
