---@type ChadrcConfig
local M = {}

M.base46 = {
    theme = "dark_horizon",
    theme_toggle = { "dark_horizon", "flexoki-light" },
}

M.nvdash = {
    load_on_startup = false,
    header = {
        "⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣴⣿⣿⣿⣿⣿⣿⣷⣦⡀⠀⠀⠀⠀",
        "⣿⣿⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣀⠀",
        "⣿⣿⣿⣿⣿⣿⣷⣄⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆",
        "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
        "⠀⠀⠛⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
        "⠀⠀⠀⠀⠀⠀⠉⠛⠻⠿⠿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⠻⠿⣿⣿⣿⣿",
        "⣿⣿⣿⣿⣿⣷⣦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⣿⣿⣿⣿⣿",
        "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
        "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣄⠀⠀⣠⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
        "⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿",
    },

    buttons = {
        { txt = "", keys = "", cmd = "" },
    },
}

M.mason = {
    pkgs = {
        "bash-language-server",
        "black",
        "clangd",
        "css-lsp",
        "eslint-lsp",
        "gopls",
        -- "haskell-debug-adapter", use the latest one from ghcup cli
        -- "haskell-language-server",
        "html-lsp",
        "json-lsp",
        "kotlin-debug-adapter",
        "kotlin-language-server",
        "ktlint",
        "lua-language-server",
        "prettier",
        "pyright",
        "python-lsp-server",
        "rust-analyzer",
        "selene",
        "shfmt",
        "stylua",
        "swiftlint",
        "typescript-language-server",
        "v-analyzer",
        "zls",
    },
}

return M
