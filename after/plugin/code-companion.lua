local code_companion = require("codecompanion")

-- Custom prompts
local prompt_library = {
    ["Unit tests"] = {
        strategy = "chat",
        description = "Generate unit tests for the selected code",
        context = {
            type = "file",
            path = {
                ".github/copilot-instructions.md"
            },
        },
        prompts = {
            {
                role = "user",
                content = [[@{read_file} the instructions in the file `.github/copilot-instructions.md` for creating tests.

Write unit tests for the code in #{buffer}.

@{files}
To grep for the test file, use the pattern `./__tests__/{filename}.test.ts*` (use path relative to the file you are testing, not the project root folder).
If the test file already exists, append the tests to the existing file, otherwise create a new file.
]]
            }
        }
    }
}

code_companion.setup({
    strategies = {
        chat = {
            adapter = "copilot",
        },
        inline = {
            adapter = "copilot",
        },
    },
    prompt_library = prompt_library,
})

vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<Leader>co", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
vim.keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })

-- Expand 'cc' into 'CodeCompanion' in the command line
vim.cmd([[cab cc CodeCompanion]])
