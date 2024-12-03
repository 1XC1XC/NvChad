require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
local nvlsp = require "nvchad.configs.lspconfig"

lspconfig.typos_lsp.setup {}

lspconfig.hls.setup {
    cmd = { "haskell-language-server-wrapper", "--lsp" },
}

lspconfig.metals.setup {
    cmd = { "/home/cx1/.local/share/coursier/bin/metals" },
    filetypes = { "scala" },
}

lspconfig.clangd.setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
    settings = {
        clangd = {
            fallbackFlags = { "-std=c++17" },
            formatting = {
                IndentWidth = 4,
                UseTab = false,
            },
        },
    },
}

lspconfig.jsonls.setup {
    capabilities = nvlsp.capabilities,
}

lspconfig.zls.setup {}
lspconfig.bashls.setup {}

local servers = { "html", "cssls", "rust_analyzer", "gopls", "ts_ls" }
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = nvlsp.on_attach,
        on_init = nvlsp.on_init,
        capabilities = nvlsp.capabilities,
    }
end

lspconfig.kotlin_language_server.setup {}

lspconfig.pylsp.setup {}
lspconfig.pyright.setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
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
}

lspconfig.ts_ls.setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
    init_options = {
        preferences = {
            disableSuggestions = true,
        },
    },
}

vim.filetype.add { extension = { v = "vlang" } }
lspconfig.v_analyzer.setup { filetypes = { "vlang" } }
