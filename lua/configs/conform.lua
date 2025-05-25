local options = {
    -- format_on_save = {
    --   -- These options will be passed to conform.format()
    --   timeout_ms = 500,
    --   lsp_fallback = true,
    -- },
}

options.formatters_by_ft = {
    --> Idomatic
    lua = { "stylua" },

    --> Default
    css = { "prettier" },
    html = { "prettier" },

    --> Interpreted
    javascript = { "prettier" },
    python = { "black" },

    --> System Language
    sh = { "beautysh" },
    zsh = { "beautysh" },

    -- Compiled
    ocaml = { "ocamlformat" },
}

return options
