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
        "ktlint",
        "bash-language-server",
        "black",
        "clangd",
        "css-lsp",
        "eslint-lsp",
        "fourmolu",
        "gopls",
        "html-lsp",
        "json-lsp",
        "kotlin-debug-adapter",
        "kotlin-language-server",
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
