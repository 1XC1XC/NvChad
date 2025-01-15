local options = {
    formatters_by_ft = {
        -- Idomatic
        lua = { "stylua" },

        -- Default
        css = { "prettier" },
        html = { "prettier" },

        -- System Language
        sh = { "shfmt" },

        -- Interpreted
        javascript = { "prettier" },
        python = { "black" },

        -- Compiled
        kotlin = { "ktlin" },
        haskell = { "fourmolu" },
    },
}

require("conform").setup(options)
