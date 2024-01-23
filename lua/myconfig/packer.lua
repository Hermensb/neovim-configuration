vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use ( 'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use ( "williamboman/mason.nvim", {run = ":MasonUpdate"})
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }
    use {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/nvim-cmp',
        'L3MON4D3/LuaSnip',
    }
    use ({'bignimbus/pop-punk.vim', as = 'pop-punk'})
    use {
        'simrat39/rust-tools.nvim',
        'mfussenegger/nvim-dap',
    }

end)
