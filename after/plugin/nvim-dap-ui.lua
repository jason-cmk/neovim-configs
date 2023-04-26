local dapui = require('dapui')
dapui.setup()

vim.keymap.set('n', '<leader>dap', function() dapui.toggle() end, { desc = '[D]ebug [A]dapter [P]rotocol' })
