-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Fun stuff
    use 'ThePrimeagen/vim-be-good'
    use 'Eandrju/cellular-automaton.nvim' -- :CellularAutomaton (make_it_rain | game_of_life)

    use 'ThePrimeagen/git-worktree.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.x',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use { 'catppuccin/nvim', as = 'catppuccin' }

    use('nvim-treesitter/nvim-treesitter', { run = 'TSUpdate' })

    use('nvim-treesitter/playground')

    use({
        "nvim-treesitter/nvim-treesitter-textobjects",
        after = "nvim-treesitter",
        requires = "nvim-treesitter/nvim-treesitter",
    })

    use('theprimeagen/harpoon')

    use('mbbill/undotree')

    use('tpope/vim-fugitive')

    use('norcalli/nvim-colorizer.lua')

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },         -- Required
            { 'hrsh7th/cmp-nvim-lsp' },     -- Required
            { 'hrsh7th/cmp-buffer' },       -- Optional
            { 'hrsh7th/cmp-path' },         -- Optional
            { 'saadparwaiz1/cmp_luasnip' }, -- Optional
            { 'hrsh7th/cmp-nvim-lua' },     -- Optional

            -- Snippets
            { 'L3MON4D3/LuaSnip' },             -- Required
            { 'rafamadriz/friendly-snippets' }, -- Optional
        }
    }

    use('paretje/nvim-man')

    -- Debugging
    use('mfussenegger/nvim-dap')
    use {
        'rcarriga/nvim-dap-ui',
        requires = {
            'mfussenegger/nvim-dap',
            'nvim-neotest/nvim-nio'
        }
    }
    use('jbyuki/one-small-step-for-vimkind')
    use('mfussenegger/nvim-dap-python')

    -- Neovim setup helper
    use('folke/neodev.nvim')

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- Optional
        },
        config = function()
            require('nvim-tree').setup {}
        end
    }

    use({
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    })

    use { 'akinsho/toggleterm.nvim', tag = '*' }

    use {
        'lewis6991/gitsigns.nvim'
    }

    use({ 'toppair/peek.nvim', run = 'deno task --quiet build:fast' })

    use('numToStr/Comment.nvim')

    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    })
end)
