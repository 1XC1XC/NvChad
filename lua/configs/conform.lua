local options = {
    formatters_by_ft = {
        lua = { "stylua" },

        css = { "prettier" },
        html = { "prettier" },
        javascript = { "prettier" },

        sh = { "shfmt" },
        python = { "black" },
        kotlin = { "ktlin" },
    },
}

require("conform").setup(options)
