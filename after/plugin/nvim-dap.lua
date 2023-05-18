local dap = require('dap')

local mason_settings = require "mason.settings"
local mason_packages_path = mason_settings.current.install_root_dir .. '\\packages'

local setup_dap_configs = function()
    local dap_python = require('dap-python')
    dap_python.setup(mason_packages_path .. '\\debugpy\\venv\\Scripts\\pythonw')

    local launch_js_path = vim.fn.getcwd() .. '\\.vscode\\launch.json'

    if vim.loop.fs_stat(launch_js_path) then
        require('dap.ext.vscode').load_launchjs(nil, { coreclr = { 'cs' } })
    else
        dap.configurations.lua = {
            {
                type = 'nlua',
                request = 'attach',
                name = "Attach to running Neovim instance"
            }
        }

        dap.configurations.cs = {
            {
                type = "coreclr",
                name = "launch - netcoredbg",
                request = "launch",
                program = function()
                    local path_prefix = vim.fn.getcwd() .. '\\bin\\Debug\\net7.0\\'
                    return vim.fn.input('Path to dll: ', path_prefix, 'file')
                end,

            },
        }
    end
end

vim.keymap.set('n', '<F5>', function()
    setup_dap_configs()
    dap.continue()
end, { desc = 'Start/continue debugging' })

vim.keymap.set('n', '<S-F5>', dap.terminate, { desc = 'Stop debugging' })
vim.keymap.set('n', '<F10>', dap.step_over, { desc = 'Step over' })
vim.keymap.set('n', '<S-F11>', dap.step_into, { desc = 'Step into' })
vim.keymap.set('n', '<F12>', dap.step_out, { desc = 'Step out' })
vim.keymap.set('n', '<Leader>b', dap.toggle_breakpoint, { desc = 'Toggle breakpoint' })
vim.keymap.set('n', '<Leader>B', function()
    local condition = vim.fn.input('Condition: ')
    dap.set_breakpoint(condition)
end, { desc = 'Set breakpoint condition' })
vim.keymap.set('n', '<Leader>dl', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, { desc = 'Set [d]ebug [l]og point' })
vim.keymap.set('n', '<Leader>dr', dap.repl.toggle, { desc = 'Toggle [d]ebug [r]epl' })
vim.keymap.set('n', '<Leader>da', dap.run_last, { desc = 'Run [d]ebug [a]gain' })

vim.fn.sign_define('DapBreakpoint', { text = '🚩', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped', { text = '🐸', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapBreakpointCondition', { text = '⛳', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapBreakpointRejected', { text = '😵', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapLogPoint', { text = '📝', texthl = '', linehl = '', numhl = '' })

-- Adapters
dap.adapters.nlua = function(callback, config)
    callback({ type = 'server', host = config.host or "127.0.0.1", port = config.port or 8086 })
end

dap.adapters.coreclr = {
    type = 'executable',
    command = mason_packages_path .. '\\netcoredbg\\netcoredbg\\netcoredbg',
    args = { '--interpreter=vscode' }
}
