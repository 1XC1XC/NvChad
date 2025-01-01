return {
    "mrcjkb/rustaceanvim",
    version = "^5",
    ft = "rust",

    ["rust-analyzer"] = {
        cargo = {
            allFeatures = true,
        },
    },

    dependencies = "mfussenegger/nvim-dap",
    config = function()
        vim.g.rustaceanvim = {
            dap = {
                adapter = {
                    type = "executable",
                    command = "/home/cx1/.config/codelldb/extension/adapter/codelldb",
                    name = "codelldb",
                },
            },
        }
    end,
}
