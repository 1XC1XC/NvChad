local providers = {
    "lsp",
    "treesitter",
    "regex",
}

local filetypes_denylist = {
    "dirbuf",
    "dirvish",
    "fugitive",
    "NvimTree",
    "packer",
    "sidebar",
    "toggleterm",
}

local large_file_overrides = {
    delay = 500,
    under_cursor = false,
}

return {
    "RRethy/vim-illuminate",
    event = "VeryLazy",
    config = function()
        require("illuminate").configure {
            delay = 100,
            under_cursor = true,
            large_file_cutoff = 5000,
            min_count_to_highlight = 1,
            providers = providers,
            filetypes_denylist = filetypes_denylist,
            large_file_overrides = large_file_overrides,
        }
    end,
}
