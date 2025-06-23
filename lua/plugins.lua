return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 1000,
    },
    { 'neovim/nvim-lspconfig' },

    -- Fun stuff
    'ThePrimeagen/vim-be-good',
    'Eandrju/cellular-automaton.nvim', -- :CellularAutomaton (make_it_rain | game_of_life)
    'ThePrimeagen/git-worktree.nvim',

    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate'
    },

    'nvim-treesitter/playground',

    {
        'nvim-treesitter/nvim-treesitter-textobjects',
        dependencies = 'nvim-treesitter/nvim-treesitter',
    },
    'mason-org/mason.nvim',
    {
        "jasonpanosso/harpoon-tabline.nvim",
        dependencies = { "ThePrimeagen/harpoon" }
    },

    'mbbill/undotree',
    'tpope/vim-fugitive',
    'norcalli/nvim-colorizer.lua',
    'paretje/nvim-man',

    {
        'CopilotC-Nvim/CopilotChat.nvim',
        dependencies = {
            'github/copilot.vim',                           -- or zbirenbaum/copilot.lua
            { 'nvim-lua/plenary.nvim', branch = 'master' }, -- for curl, log and async functions
        },
        build = 'make tiktoken'
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

    { 'toppair/peek.nvim', build = 'deno task --quiet build:fast' },

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
}
