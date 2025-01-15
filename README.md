# NvChad Custom Configuration

This repository contains a custom configuration for [NvChad](https://github.com/NvChad/NvChad), a highly customizable and fast Neovim fork.

## Custom Plugins

- [auto-save.nvim](https://github.com/Pocco81/auto-save.nvim): Automatically save your changes
- [nvim-notify](https://github.com/rcarriga/nvim-notify): A fancy, configurable, notification manager
- [neoscroll.nvim](https://github.com/karb94/neoscroll.nvim): Smooth scrolling plugin written in lua
- [twilight.nvim](https://github.com/folke/twilight.nvim): Dim inactive portions of the code you're editing
- [vim-illuminate](https://github.com/RRethy/vim-illuminate): Automatically highlighting other uses of the word under the cursor
- [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim): Markdown preview in browser with scrolling & configuration
- [rustaceanvim](https://github.com/mrcjkb/rustaceanvim): Rust development tools
- [v-vim](https://github.com/ollykel/v-vim): Configuration for the V programming language

## Custom Keybindings

| Mode   | Keybinding   | Description
|-       |-             |-
| N & T | `<A-m>` | Toggle floating terminal
| Normal | `<A-e>`      | Toggle Illuminate Plugin
| Normal | `<leader>tw` | Toggle Twilight Plugin
| Normal | `<leader>md` | Toggle Markdown Preview (Issues)
| Normal | `<leader>fm` | Format files and remove carriage returns
| Normal | `<leader>df` | Open diagnostic float
| Normal | `<leader>lw` | Toggle line wrapping
| Normal | `<leader>rcs`| Clear specific register
| Normal | `<leader>rcC`| Clear all registers
| Insert | `jk`         | Quick exit insert mode
| Insert | `<A-d>`      | Go to end of line

For a detailed list of keybindings and their corresponding Lua functions, please refer to the `lua/mappings.lua` file.

## Credits

- [Vim](https://github.com/vim/vim) for laying the foundation of modal text editing, pioneering an editor that has withstood the test of time and remains a core influence in the world of development.
- [Neovim](https://github.com/neovim/neovim) for modernizing Vim’s architecture, bringing new extensibility and performance improvements while staying true to its roots, allowing developers to build upon a time-tested tool with fresh capabilities.
- [NvChad](https://github.com/NvChad/NvChad) for pushing the boundaries further by offering a sleek, fast, and customizable Neovim configuration tailored for developers who want efficiency and elegance in their workflow.
