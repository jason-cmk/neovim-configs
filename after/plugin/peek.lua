local peek = require('peek')

peek.setup()

vim.api.nvim_create_user_command('Markdown', function()
    if peek.is_open() then
        peek.close()
    else
        peek.open()
    end
end, {})
