return {
    "mrcjkb/rustaceanvim",
    version = "^6",
    lazy = true,
    ft = "rust",
    dependencies = {
        "mfussenegger/nvim-dap",
        "williamboman/mason.nvim",
    },

    config = function()
        local GBS = 4
        local THREADS = 4

        local codelldb_path = require("mason-registry").get_package("codelldb"):get_install_path()
            .. "/extension/adapter/codelldb"

        local env_config = {
            RUST_ANALYZER_PROC_MACRO_ENABLE = "false",
            RUST_ANALYZER_MEMORY_LIMIT = tostring(1024 * GBS),
            RUST_ANALYZER_CACHE = "0",
            RUSTFLAGS = "-C codegen-units=1",
            RUST_LOG = "error",
        }

        local rust_analyzer_config = {
            numThreads = THREADS,
            hover = { enable = false },
            completion = { maxItems = 50 },
            signatureInfo = { enable = false },
            inlayHints = { enable = false },
            checkOnSave = { enable = false },
            procMacro = { enable = false },
            diagnostics = { disabled = { "unresolved-proc-macro" } },
            cargo = {
                allFeatures = false,
                loadOutDirsFromCheck = false,
                autoreload = true,
            },
        }

        local dap_config = {
            adapter = {
                type = "executable",
                command = codelldb_path,
                name = "codelldb",
            },
        }

        for k, v in pairs(env_config) do
            vim.env[k] = v
        end

        vim.g.rustaceanvim = {
            server = {
                settings = {
                    ["rust-analyzer"] = rust_analyzer_config,
                },
            },
            dap = dap_config,
        }

        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
                local client = vim.lsp.get_client_by_id(args.data.client_id)
                if not client then
                    return
                end
                if client.name ~= "rust_analyzer" then
                    return
                end

                client.config.flags = { allow_incremental_sync = false }
                client.handlers["textDocument/signatureHelp"] = function() end
            end,
        })
    end,
}
