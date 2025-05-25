return {

    {
        "stevearc/conform.nvim",
        opts = require "configs.conform",
    },

    {
        "karb94/neoscroll.nvim",
        event = "VeryLazy",
        config = function()
            require("neoscroll").setup {}
        end,
    },

    {
        "ollykel/v-vim",
        event = "VeryLazy",
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
    },

    {
        "Pocco81/auto-save.nvim",
        event = "VeryLazy",
        config = function()
            local trigger_events = {
                "InsertLeave",
                "TextChanged",
                "InsertChange",
                "ModeChanged",
            }
            require("auto-save").setup {
                trigger_events = trigger_events,
            }
        end,
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
            automatic_installation = { exclude = { "ocamllsp" } },
            ensure_installed = {
                --> Idomatic
                "vim",
                "vimdoc",

                --> System Languages
                "bash",

                --> Interpreted
                "lua",
                "luau",

                --> Compiled
                "rust",
                "go",
                "gomod", --> Go Modularity
                "cpp",
                "c",

                --> Markup Languages
                "html",
                "css",

                --> Data Serialization
                "json",
                "toml",
            },
        },
    },
}
