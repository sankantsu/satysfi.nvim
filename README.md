# satysfi.nvim

Provides configurations of [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) and [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) for [SATySFi](https://github.com/gfngfn/SATySFi) language.

## Settings

```lua
require("satysfi-nvim").setup()
```

## Features

### `nvim-lspconfig` integration

This plugin registers `satysfi-language-server` to lspconfig as `satysfi_ls`.
So you can setup `satysfi-language-serve` as follows.

```lua
require("lspconfig").satysfi_ls.setup {}
```

You can also benefit from `ensure_installed` or `automatic-server-setup` functionality if you are using [`mason-lspconfig.nvim`](https://github.com/williamboman/mason-lspconfig.nvim).

See also [satysfi-mason-registry](https://github.com/sankantsu/satysfi-mason-registry/tree/2023-12-17) for installation of satysfi-language-server using [mason.nvim](https://github.com/williamboman/mason.nvim).

### `nvim-treesitter` integration

This plugin registers `tree-sitter-satysfi` as a treesitter parser.
You can install treesitter parser for satysfi by `:TSInstall satysfi` or setting `ensure_installed`.

This plugin also contains query files from `tree-sitter-satysfi`, so you have no need to manually copy these files yourself.

## LICENSE

This software is released under the MIT License, see LICENSE.
