require "nvchad.mappings"

local map = vim.keymap.set
local twilight = require "twilight.view"
local illuminate = require "illuminate"
local notify = require "notify"

vim.wo.wrap = false

local function S(bool, t, f, append)
    return (append or " ") .. (bool and t or f)
end

-- Handler functions (flattened)
local function code_action()
    vim.lsp.buf.code_action()
end

local function toggle_illuminate()
    vim.cmd "IlluminateToggle"
    notify(S(not illuminate.is_paused(), "Enabled", "Disabled"), "warn", {
        title = "Illuminate",
        icon = "🔍",
        timeout = 2000,
    })
end

local function toggle_markdown()
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
end

local function toggle_twilight()
    vim.cmd "Twilight"
    notify(S(twilight.enabled, "Enabled", "Disabled", " "), "info", {
        title = "Twilight",
        icon = S(twilight.enabled, "🌑", "🌕"),
        timeout = 2000,
    })
end

local function format_and_clean()
    require("conform").format { lsp_fallback = true }
    vim.cmd [[%s/\r$//e]]
end

function open_mason()
    vim.cmd "Mason"
end

function update_mason()
    vim.cmd "MasonUpdate"
end

function open_lazy()
    vim.cmd "Lazy"
end

function sync_lazy()
    vim.cmd "Lazy update"
end

local function diagnostic_float()
    vim.diagnostic.open_float()
end

local function clear_specific_register()
    local reg = vim.fn.input "Clear Register Input: "
    if reg ~= "" then
        vim.cmd("let @" .. reg .. '=""')
    end
end

local function clear_all_registers()
    local registers = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"'
    for i = 1, #registers do
        local reg = registers:sub(i, i)
        vim.cmd("let @" .. reg .. ' = ""')
    end
end

local function toggle_wrap()
    vim.wo.wrap = not vim.wo.wrap
    notify(S(vim.wo.wrap, "Enabled", "Disabled", " "), "info", {
        title = "Line Wrap",
        icon = "🔄",
        timeout = 2000,
    })
end

local function toggle_float_term()
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
end

-- Key mappings (flat + readable)
local mappings = {
    n = {
        ["<leader>om"] = { open_mason, desc = "Open Mason" },
        ["<leader>oM"] = { update_mason, desc = "Update Mason" },
        ["<leader>ol"] = { open_lazy, desc = "Open Lazy Plugins" },
        ["<leader>oL"] = { sync_lazy, desc = "Update Plugins" },
        ["<leader>ca"] = { code_action, desc = "LSP Code Action" },
        ["<A-e>"] = { toggle_illuminate, desc = "Toggle Illuminate" },
        ["<leader>md"] = { toggle_markdown, desc = "Toggle Markdown Preview" },
        ["<leader>tw"] = { toggle_twilight, desc = "Toggle Twilight" },
        ["<leader>fm"] = { format_and_clean, desc = "Format Files & Remove CRs" },
        ["<leader>df"] = { diagnostic_float, desc = "Open Diagnostic Float" },
        ["<leader>rcs"] = { clear_specific_register, desc = "Clear Specific Register" },
        ["<leader>rcC"] = { clear_all_registers, desc = "Clear All Registers" },
        ["<leader>lw"] = { toggle_wrap, desc = "Toggle Line Wrapping" },
    },
    i = {
        ["jk"] = { "<ESC>", desc = "Quick Exit Insert Mode" },
        ["<A-d>"] = { "<End>", desc = "Go to End of Line" },
    },
    ["n,t"] = {
        ["<A-m>"] = { toggle_float_term, desc = "Toggle Floating Terminal" },
    },
}

-- Mapping application
local function apply_mappings(tbl)
    for modes, mode_map in pairs(tbl) do
        local mode_list = vim.split(modes, ",")
        for _, mode in ipairs(mode_list) do
            for lhs, rhs in pairs(mode_map) do
                local cmd, opts = rhs[1] or rhs, rhs.desc and { desc = rhs.desc } or {}
                map(mode, lhs, cmd, vim.tbl_extend("force", { noremap = true, silent = true }, opts))
            end
        end
    end
end

apply_mappings(mappings)
