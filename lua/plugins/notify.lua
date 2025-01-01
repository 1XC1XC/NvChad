return {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    config = function()
        local native = vim.notify
        local notify = require "notify"

        notify.setup {
            background_colour = "#000000",
            fps = 60,
            level = 2,
            minimum_width = 50,
            render = "default",
            stages = "fade_in_slide_out",
            timeout = 3000,
            top_down = true,
            icons = {
                ERROR = "",
                WARN = "",
                INFO = "",
                DEBUG = "",
                TRACE = "✎",
            },
        }

        local call = function(message, ...)
            if message:match "^%[NvimTree%].*" then
                native(message, ...)
                return
            end
            notify(message, ...)
        end

        -- local call = function(message, ...)
        --     if message:match "^%[NvimTree%]%s/home/cx1/.*%s->%s/home/cx1/.*" then
        --         native(message, ...)
        --         return
        --     end
        --     notify(message, ...)
        -- end

        vim.notify = call
    end,
}
