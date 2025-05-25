local lspconfig = require "lspconfig"
local nvlsp = require "nvchad.configs.lspconfig"

---@diagnostic disable-next-line: lowercase-global
table.merge = function(a, b)
    local t = {}
    for k, v in pairs(a) do
        t[k] = v
    end
    for k, v in pairs(b) do
        t[k] = v
    end
    return t
end

local base = {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
}

require("lspconfig").bashls.setup {
    filetypes = { "sh", "bash", "zsh" },
    cmd_env = { SHELLCHECK_PATH = "/usr/bin/shellcheck" },
}

for _, x in ipairs {
    "luau_lsp", -- Lua
    "zls", -- Zig
    -- "taplo", -- TOML
} do
    lspconfig[x].setup {}
end

-- Base-injected handlers
for _, lsp in ipairs {
    -- Compiled Languages [Statically Typed]
    -- "rust_analyzer", -- Rust
    "gopls", -- Go

    -- Interpreted Languages [Dynamically Typed]
    "pylsp", -- Python

    -- System Language
    -- "bashls", -- Bash

    -- Markup & Styling Languages
    "html", -- HTML
    "cssls", -- CSS
    -- Data Serialization
    "jsonls", -- JSON
} do
    lspconfig[lsp].setup(base)
end

-- Pyright custom config
lspconfig.pyright.setup(table.merge(base, {
    settings = {
        python = {
            pythonPath = vim.fn.exepath "python",
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "openFilesOnly",
                useLibraryCodeForTypes = true,
            },
        },
    },
}))

lspconfig.ts_ls.setup(table.merge(base, {
    init_options = {
        preferences = {
            disablesuggestions = true,
        },
    },
}))

vim.filetype.add { extension = { v = "vlang" } }
lspconfig.v_analyzer.setup {
    filetypes = { "vlang" },
}

lspconfig.metals.setup(table.merge(base, {
    cmd = { "/home/cx1/.local/share/coursier/bin/metals" },
    filetypes = { "scala" },
}))

lspconfig.clangd.setup(table.merge(base, {
    settings = {
        clangd = {
            fallbackFlags = { "-std=c++17" },
            formatting = {
                IndentWidth = 4,
                UseTab = false,
            },
        },
    },
}))
