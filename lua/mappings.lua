require "nvchad.mappings"
local map = vim.keymap.set
local twilight = require "twilight.view"
local illuminate = require "illuminate"
local notify = require "notify"

local function S(boolean, t, f, append)
    return (append or " ") .. (boolean and t or f)
end

vim.wo.wrap = false

local mappings = {
    n = {
        ["<A-e>"] = {
            function()
                vim.cmd "IlluminateToggle"
                notify(S(not illuminate.is_paused(), "Enabled", "Disabled"), "warn", {
                    title = "Illuminate",
                    icon = "🔍",
                    timeout = 2000,
                })
            end,
            desc = "Toggle Illuminate",
        },
        ["<leader>md"] = {
            function()
                if vim.bo.filetype == "markdown" then
                    vim.cmd "MarkdownPreviewToggle"
                    notify("Markdown Preview", "info", {
                        title = "Markdown",
                        icon = "📖",
                        timeout = 2000,
                    })
                else
                    notify("Markdown File Required", "warn", {
                        title = "Markdown Preview",
                        icon = "⚠️",
                        timeout = 2000,
                    })
                end
            end,
            desc = "Toggle Markdown Preview",
        },
        ["<leader>tw"] = {
            function()
                vim.cmd "Twilight"
                notify(S(twilight.enabled, "Enabled", "Disabled", " "), "info", {
                    title = "Twilight",
                    icon = S(twilight.enabled, "🌑", "🌕"),
                    timeout = 2000,
                })
            end,
            desc = "Toggle Twilight",
        },
        ["<leader>fm"] = {
            function()
                require("conform").format { lsp_fallback = true }
                vim.cmd [[%s/\r$//e]]
            end,
            desc = "Format Files & Remove Carriage Returns",
        },
        ["<leader>df"] = {
            function()
                vim.diagnostic.open_float()
            end,
            desc = "Open Diagnostic Float",
        },
        ["<leader>rcs"] = {
            function()
                local register = vim.fn.input "Clear Register Input: "
                if register ~= "" then
                    vim.cmd("let @" .. register .. '=""')
                end
            end,
            desc = "Clear Specific Register",
        },
        ["<leader>rcC"] = {
            function()
                local registers = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"'
                for i = 1, #registers do
                    local reg = registers:sub(i, i)
                    vim.cmd("let @" .. reg .. ' = ""')
                end
            end,
            desc = "Clear All Registers",
        },
        ["<leader>lw"] = {
            function()
                vim.wo.wrap = not vim.wo.wrap
                notify(S(vim.wo.wrap, "Enabled", "Disabled", " "), "info", {
                    title = "Line Wrap",
                    icon = "🔄",
                    timeout = 2000,
                })
            end,
            desc = "Toggle Line Wrapping",
        },
        -- Removed due to cross-language compatibility issues
        -- ["<leader>dc"] = {
        --     function()
        --         vim.cmd([[%s/^\s*\/\/.*$//ge]])
        --     end,
        --     desc = "Remove all '//' comments",
        -- },
    },
    i = {
        ["jk"] = {
            "<ESC>",
            desc = "Quick Exit Insert Mode",
        },
        ["<A-d>"] = {
            "<End>",
            desc = "Go to End of Line",
        },
    },
    ["n,t"] = {
        ["<A-m>"] = {
            function()
                require("nvchad.term").toggle {
                    pos = "float",
                    id = "floatTerm",
                    float_opts = {
                        relative = "editor",
                        border = "rounded",
                        width = 0.85,
                        height = 0.75,
                        row = 0.05,
                        col = 0.055,
                    },
                }
            end,
            desc = "Toggle Floating Terminal",
        },
    },
}

local function apply_mappings(x)
    for modes, mode_mappings in pairs(x) do
        local mode_list = vim.split(modes, ",")
        for _, mode in ipairs(mode_list) do
            for lhs, rhs in pairs(mode_mappings) do
                if type(rhs) == "table" then
                    map(mode, lhs, rhs[1], { noremap = true, silent = true, desc = rhs.desc })
                else
                    map(mode, lhs, rhs, { noremap = true, silent = true })
                end
            end
        end
    end
end

apply_mappings(mappings)

