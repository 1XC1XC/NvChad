return {

    {
        "mrcjkb/rustaceanvim",
        version = "^5",
        ["lazy-analyzer"] = {
            cargo = {
                allFeatures = true,
            },
        },
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
        "rcarriga/nvim-notify",
        event = "VeryLazy",
        config = function()
            local native = vim.notify
            local notify = require "notify"

            notify.setup {
                background_colour = "#000000",
                fps = 60,
                level = 2,
                minimum_width = 50,
                render = "default",
                stages = "fade_in_slide_out",
                timeout = 3000,
                top_down = true,
                icons = {
                    ERROR = "",
                    WARN = "",
                    INFO = "",
                    DEBUG = "",
                    TRACE = "✎",
                },
            }

            local call = function(message, ...)
                if message:match "^%[NvimTree%]%s/home/cx1/.*%s->%s/home/cx1/.*" then
                    native(message, ...)
                    return
                end
                notify(message, ...)
            end

            vim.notify = call
        end,
    },

    {
        "RRethy/vim-illuminate",
        event = "VeryLazy",
        config = function()
            require("illuminate").configure {
                providers = {
                    "lsp",
                    "treesitter",
                    "regex",
                },
                delay = 100,
                filetypes_denylist = {
                    "dirbuf",
                    "dirvish",
                    "fugitive",
                    "NvimTree",
                    "packer",
                    "sidebar",
                    "toggleterm",
                },
                under_cursor = true,
                large_file_cutoff = 5000,
                large_file_overrides = {
                    delay = 500,
                    under_cursor = false,
                },
                min_count_to_highlight = 1,
            }
        end,
    },

    {
        "ollykel/v-vim",
        event = "VeryLazy",
    },

    {
        "folke/twilight.nvim",
        cmd = "Twilight",
        config = function()
            require("twilight").setup {
                dimming = {
                    alpha = 0.25,
                    color = { "Normal", "#ffffff" },
                    inactive = true,
                },
                context = 10,
            }
        end,
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
