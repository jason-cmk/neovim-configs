return {
    cmd = {
        "sonarlint-language-server",
        -- Ensure that sonarlint-language-server uses stdio channel
        "-stdio",
        "-analyzers",
        -- paths to the analyzers you need, using those for python and java in this example
        vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarpython.jar"),
        vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarcfamily.jar"),
        vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarjava.jar"),
        vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarjs.jar"),
    },
    filetypes = {
        -- Tested and working
        "typescript",
        "typescriptreact",
        "javascript",
        "javascriptreact",
        "cs",
        "dockerfile",
        "python",
        "cpp",
        "java",
    },
    root_markers = { '.git' },
    -- on_attach = function(client, bufnr)
    --     -- Force diagnostics refresh
    --     vim.diagnostic.reset(nil, bufnr)
    -- end,
    handlers = {
        ["sonarlint/isOpenInEditor"] = function(_, params)
            return { isOpen = true }
        end,
        ["sonarlint/showSonarLintOutput"] = function() end,
        ["sonarlint/openJavaHomeSettings"] = function() end,
        ["sonarlint/browseToFindJavaHome"] = function() end,
        ["sonarlint/showAllLocationIssues"] = function() end,
    },
    settings = {
        sonarlint = {
            -- Enable all rules
            -- rules = {},
            test = "test"
        }
    },
    -- settings = {
    --     sonarlint = {
    --         rules = {
    --             ["typescript:S1481"] = "error", -- unused variables
    --             ["typescript:S1854"] = "error", -- unused assignments
    --             ["javascript:S1481"] = "error", -- unused variables
    --             ["javascript:S1854"] = "error", -- unused assignments
    --         }
    --     }
    -- },
    init_options = {
        telemetryEnabled = false,
        showAnalyzerLogs = true,
    }
}
