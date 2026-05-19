return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 1000,
    },
    { 'neovim/nvim-lspconfig' },

    {
        'nvim-telescope/telescope.nvim',
        version = '*',
        dependencies = {
            'nvim-lua/plenary.nvim',
            -- optional but recommended
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        }
    },

    -- Fun stuff
    'ThePrimeagen/vim-be-good',
    'Eandrju/cellular-automaton.nvim', -- :CellularAutomaton (make_it_rain | game_of_life)
    'ThePrimeagen/git-worktree.nvim',

    'mason-org/mason.nvim',
    {
        "jasonpanosso/harpoon-tabline.nvim",
        dependencies = { "ThePrimeagen/harpoon" }
    },

    'mbbill/undotree',
    'tpope/vim-fugitive',
    'tpope/vim-abolish',
    {
        "catgoose/nvim-colorizer.lua",
        event = "BufReadPre",
    },
    'paretje/nvim-man',
    "nvim-lua/plenary.nvim",
    -- nvim-treesitter 1.x: must not be lazy-loaded (see plugin README). Keeps queries + parsers in sync.
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter").setup()
        end,
    },
    {
        "MeanderingProgrammer/render-markdown.nvim",
        ft = { "markdown" }
    },
    {
        "echasnovski/mini.diff",
        config = function()
            local diff = require("mini.diff")
            diff.setup({
                -- Disabled by default
                source = diff.gen_source.none(),
            })
        end,
    },

    -- Debugging
    'mfussenegger/nvim-dap',
    {
        'rcarriga/nvim-dap-ui',
        dependencies = {
            'mfussenegger/nvim-dap',
            'nvim-neotest/nvim-nio'
        }
    },
    'jbyuki/one-small-step-for-vimkind',
    'mfussenegger/nvim-dap-python',

    -- Neovim setup helper
    'folke/neodev.nvim',

    {
        'nvim-tree/nvim-tree.lua',
        dependencies = {
            'nvim-tree/nvim-web-devicons', -- Optional
        },
        config = function()
            require('nvim-tree').setup {}
        end
    },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },

    { 'akinsho/toggleterm.nvim', version = '*' },

    'lewis6991/gitsigns.nvim',

    {
        "toppair/peek.nvim",
        event = { "VeryLazy" },
        build = "deno task --quiet build:fast",
        config = function()
            require("peek").setup()
            vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
            vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
        end,
    },

    'numToStr/Comment.nvim',

    {
        'kylechui/nvim-surround',
        version = '*', -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require('nvim-surround').setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },

    {
        "vinnymeller/swagger-preview.nvim",
        cmd = { "SwaggerPreview", "SwaggerPreviewStop", "SwaggerPreviewToggle" },
        build = "npm i",
        config = true,
    },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        ---@type Flash.Config
        opts = {},
        keys = {
            { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
            { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
            { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
            { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
        },
    }
}
