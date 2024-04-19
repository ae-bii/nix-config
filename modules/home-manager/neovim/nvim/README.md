
## File structure

```shell
tree ~/.config/nvim
├── init.lua
├── lazy-lock.json
└── lua
    ├── config
    │   ├── autocmds.lua
    │   ├── custom
    │   │   └── init.lua
    │   ├── init.lua
    │   ├── keymaps.lua
    │   └── options.lua
    └── plugins
        ├── autopairs.lua
        ├── colorizer.lua
        ├── colorscheme.lua
        ├── comment.lua
        ├── custom
        │   ├── colorscheme.lua
        │   └── lush.lua
        ├── gitsigns.lua
        ├── lsp.lua
        ├── lualine.lua
        ├── neoterm.lua
        ├── telescope.lua
        ├── tree.lua
        └── treesitter.lua
```

## Plugins & LSP

### Plugins

| Plugin                                                                            | Description                                                                                                                                                       |
| --------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [lazy.nvim](https://github.com/folke/lazy.nvim)                                   | A modern plugin manager for Neovim                                                                                                                                |
| [mason.nvim](https://github.com/williamboman/mason.nvim)                          | Portable package manager for Neovim that runs everywhere Neovim runs. Easily install and manage LSP servers, DAP servers, linters, and formatters.                |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)                        | A collection of common configurations for Neovim's built-in language server client                                                                                |
| [gitsigns](https://github.com/lewis6991/gitsigns.nvim)                            | Super fast git decorations implemented purely in lua/teal                                                                                                         |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)             | Nvim Treesitter configurations and abstraction layer                                                                                                              |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)                                   | Auto completion plugin                                                                                                                                            |
| [LuaSnip](https://github.com/L3MON4D3/LuaSnip)                                    | Snippet Engine for Neovim written in Lua                                                                                                                          |
| [nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua) -                    | A File Explorer written In Lua                                                                                                                                    |
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs)                        | A super powerful autopairs for Neovim                                                                                                                             |
| [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)               | Lua `fork` of vim-web-devicons for neovim                                                                                                                         |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)                      | A blazing fast and easy to configure neovim statusline plugin written in pure lua.                                                                                |
| [Comment.nvim](https://github.com/numToStr/Comment.nvim)                          | Smart and powerful comment plugin for neovim. Supports treesitter, dot repeat, left-right/up-down motions, hooks, and more                                        |
| [norcalli/nvim-colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua)     | The fastest Neovim colorizer.                                                                                                                                     |
| [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Find, Filter, Preview, Pick. All lua, all the time.                                                                                                               |
| [itmecho/neoterm.nvim](https://github.com/itmecho/neoterm.nvim)                   | Neovim lua plugin for managing a floating terminal window                                                                                                         |
| [rosé-pine](https://github.com/rose-pine/neovim)                                  | Soho vibes for Neovim                                                                                                                                             |
| [folke/tokyonight.nvim](https://github.com/folke/tokyonight.nvim)                 | A clean, dark Neovim theme written in Lua, with support for lsp, treesitter and lots of plugins. Includes additional themes for Kitty, Alacritty, iTerm and Fish. |
| [projekt0n/github-nvim-theme](https://github.com/projekt0n/github-nvim-theme)     | Github's Neovim themes                                                                                                                                            |
| [null-ls](https://github.com/jose-elias-alvarez/null-ls.nvim)                     | Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.                                                                        |

### LSP

This configuration provides Python and Golang dev environment. The programming language server is current supported:

- lua - [builtin](https://neovim.io/doc/user/lua.html).
- python - [ruff_lsp](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ruff_lsp)
- golang - [gopls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#gopls)
- docker - [dockerls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#dockerls)
- bash - [bashls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#bashls)
- vim - [vimls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#vimls)
- yaml - [yamlls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#yamlls)
- json - [jsonls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#jsonls)

Furthermore, it integrates with [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) to provide rich syntax highlighting and other language parsing magic.

If your language is not supported, please follow this:

- Check if LSP support is available in the [lspconfig repo](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md). To install a supported language server with [mason](https://github.com/williamboman/mason.nvim):

```vim
:LspInstall `<your_language_server>`
```

- Check if your syntax is supported in the [treesitter repo](https://github.com/nvim-treesitter/nvim-treesitter). To install a language syntax highlight, run:

```vim
:TSInstall `<language_to_install>`
```

## Keymaps

These are the default keymaps, in the following shortcuts, the `<leader>`+` key is set up to `` (space) character, check: [keymaps.lua](./nvim/lua/core/keymaps.lua).

| Shortcut                       | Mode     | Description                                   |
| ------------------------------ | -------- | --------------------------------------------- |
| <kbd>kk</kbd>                  | Insert   | Esc with `kk`                                 |
| `<leader>`+<kbd>r</kbd>        | Normal   | Reload configuration file                     |
| `<leader>`+<kbd>s</kbd>        | Normal   | Save file                                     |
| `<leader>`+<kbd>q</kbd>        | Normal   | Save (close all windows) and exit from Neovim |
| `<leader>`+<kbd>tt</kbd>       | Normal   | Open floating terminal                        |
| <kbd>Esc<kbd>                  | Terminal | Exit terminal                                 |
| `<leader>`+<kbd>n</kbd>        | Normal   | Open NvimTree                                 |
| `<leader>`+<kbd>nr</kbd>       | Normal   | Refresh NvimTree                              |
| `<leader>`+<kbd>nf</kbd>       | Normal   | Find file in NvimTree                         |
| `<leader>`+<kbd>ff</kbd>       | Normal   | Open Telescope to find files                  |
| `<leader>`+<kbd>fg</kbd>       | Normal   | Open Telescope to do live grep                |
| `<leader>`+<kbd>fb</kbd>       | Normal   | Open Telescope to list buffers                |
| `<leader>`+<kbd>fh</kbd>       | Normal   | Open Telescope to show help                   |
| `<leader>`+<kbd>wh/j/k/l</kbd> | Normal   | Move around splits                            |
| <kbd>mm</kbd>                  | Normal   | Comment/Uncomment line                        |
| <kbd>mbm</kbd>                 | Normal   | Comment/Uncomment block                       |
| <kbd>m</kbd>                   | Visual   | Comment/Uncomment line                        |
| <kbd>mb</kbd>                  | Visual   | Comment/Uncomment block                       |

There are many default keymaps, you can check it using `:map` command. There are also other variants:

- `:nmap` for normal mode mappings
- `:vmap` for visual mode mappings
- `:imap` for insert mode mappings

The above list is not complete. Typing `:help map` in Vim will give you more info.

## Customization

- You can add your custom plugin specs under `lua/plugins/custom`. All files will be automatically loaded by `lazy.nvim`.
- You can also add your custom keymaps/options under `lua/config/custom`.
