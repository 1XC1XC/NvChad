return {
    "folke/twilight.nvim",
    cmd = "Twilight",
    config = function()
        dimming = {
            alpha = 0.25,
            color = { "Normal", "#ffffff" },
            inactive = true,
        }

        require("twilight").setup {
            dimming = dimming,
            context = 10,
        }
    end,
}
