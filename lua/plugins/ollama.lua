local cmd = { "Ollama", "OllamaModel", "OllamaServe", "OllamaServeStop" }

local keys = {
    {
        "<leader>oo",
        ":<c-u>lua require('ollama').prompt()<cr>",
        desc = "Ollama: Prompt",
        mode = { "n", "v" },
    },

    {
        "<leader>oM",
        ":<c-u>lua require('ollama').prompt('Modify_Code')<cr>",
        desc = "Ollama: Generate Code",
        mode = { "n", "v" },
    },

    {
        "<leader>oG",
        ":<c-u>lua require('ollama').prompt('Generate_Code')<cr>",
        desc = "Ollama: Generate Code",
        mode = { "n", "v" },
    },
}

-- gemma3:latest         a2af6cc3eb7f    3.3 GB    12 minutes ago
-- gemma3:4b             a2af6cc3eb7f    3.3 GB    12 minutes ago
-- deepseek-r1:1.5b      a42b25d8c10a    1.1 GB    3 months ago
-- qwen2.5-coder:7b      2b0496514337    4.7 GB    4 months ago
-- qwen2.5-coder:3b      e7149271c296    1.9 GB    5 months ago
-- qwen2.5-coder:0.5b    d392ed348d5b    531 MB    5 months ago

local opts = {
    model = "gemma3:4b",

    url = "http://127.0.0.1:11434",

    serve = {
        on_start = false,
        command = "ollama",
        args = { "serve" },
        stop_command = "pkill",
        stop_args = { "-SIGTERM", "ollama" },
    },
}

return {
    "nomnivore/ollama.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    cmd = cmd,
    keys = keys,
    opts = opts,
}
