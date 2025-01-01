return {

    -- {
    --     "mrcjkb/rustaceanvim",
    --     version = "^5",
    --     lazy = false,
    --     ["rust-analyzer"] = {
    --         cargo = {
    --             allFeatures = true,
    --         },
    --     },
    -- },

    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
    },

    {
        "ollykel/v-vim",
        event = "VeryLazy",
    },

    {
        "karb94/neoscroll.nvim",
        event = "VeryLazy",
        config = function()
            require("neoscroll").setup {}
        end,
    },

    {
        "Pocco81/auto-save.nvim",
        event = "VeryLazy",
        config = function()
            require("auto-save").setup {
                trigger_events = {
                    "InsertLeave",
                    "TextChanged",
                    "InsertChange",
                    "ModeChanged",
                },
            }
        end,
    },

    {
        "stevearc/conform.nvim",
        opts = require "configs.conform",
    },

    {
        "neovim/nvim-lspconfig",
        config = function()
            require "configs.lspconfig"
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "vim",
                "lua",
                "vimdoc",
                "html",
                "css",
            },
        },
    },
}
