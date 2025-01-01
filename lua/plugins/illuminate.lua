return {
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
}
