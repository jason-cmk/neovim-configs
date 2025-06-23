local chat = require("CopilotChat")
chat.setup {
    -- See Configuration section for options
}

-- Keymaps
vim.keymap.set("n", "<leader>co", chat.toggle, { desc = "Open Copilot Chat" })
vim.keymap.set("n", "<leader>cr", chat.reset, { desc = "Reset Copilot Chat" })
vim.keymap.set("n", "<leader>pr", chat.select_prompt, { desc = "Open Copilot Chat" })
vim.keymap.set("n", "<leader>ai", function()
    vim.ui.input({ prompt = " ✨ " }, function(input)
        if input and input ~= "" then
            chat.ask(input)
        else
            vim.notify("No input provided", vim.log.levels.WARN)
        end
    end)
end, { desc = "Ask Copilot Chat" })
