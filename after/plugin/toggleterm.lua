local toggleterm = require('toggleterm')

local fileSystemSeparator = package.config:sub(1,1)
local shell

if fileSystemSeparator == '/' then
    shell = 'bash'
else
    shell = 'powershell'
end

toggleterm.setup {
    direction = 'vertical',
    size = 75,
    open_mapping = '<leader>tm',
    shell = shell
}

-- Never map leader key in insert mode
vim.keymap.del('i', '<leader>tm')
