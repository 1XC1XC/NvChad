return {
    "folke/twilight.nvim",
    cmd = "Twilight",
    config = function()
        require("twilight").setup {
            dimming = {
                alpha = 0.25,
                color = { "Normal", "#ffffff" },
                inactive = true,
            },
            context = 10,
        }
    end,
}
