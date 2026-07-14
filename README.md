**This repo is supposed to be used as config by NvChad/Nvim users!**

- The main nvchad repo (NvChad/NvChad) is used as a plugin by this repo.
- So you just import its modules , like `require "nvchad.options" , require "nvchad.mappings"`
- So you can delete the .git from this repo ( when you clone it locally ) or fork it :)
- This repo is mainly for me to have my nvim config easily accessible

# Custom additions

On top of the NvChad base (`nvim-cmp`, `mason.nvim`, `gitsigns.nvim`, `nvim-autopairs`, etc. already ship in core), this config adds:

## Git
- **diffview.nvim** — side-by-side diff and file history viewer.
  - `<leader>gd` — open diff view
  - `<leader>gh` — open file history for current file/repo

## Diagnostics / TODOs
- **trouble.nvim** — pretty list of diagnostics, quickfix, LSP references, etc.
  - `<leader>xx` or `:Trouble` — toggle diagnostics list
- **todo-comments.nvim** — highlights `TODO`, `FIXME`, `HACK`, `NOTE`, `WARNING` comments.
  - No keymap needed, just highlights automatically as you type/open files.
  - `:TodoTelescope` to search all TODOs in the project (if telescope installed, which it is via core).

## LSP
- **mason-lspconfig.nvim** — bridges `mason.nvim`-installed LSP servers into `nvim-lspconfig` automatically.
  - `ensure_installed` list lives in `lua/plugins/init.lua`, currently `{ "html", "cssls" }` (matches `lua/configs/lspconfig.lua`).
  - Add a language server: run `:Mason` to browse/install, add its name to both `ensure_installed` here and `servers` in `lua/configs/lspconfig.lua`.

## Debugging
- **nvim-dap** + **nvim-dap-ui** + **nvim-dap-virtual-text** — full debugger with UI and inline variable values.
  - `<leader>db` — toggle breakpoint
  - `<leader>dc` — continue / start debugging
  - `<leader>di` — step into
  - `<leader>do` — step over
  - `<leader>dO` — step out
  - `<leader>dr` — toggle REPL
  - `<leader>du` — toggle debugger UI
  - Note: DAP needs a debug adapter per language (e.g. `debugpy` for Python, `delve` for Go) — install via `:Mason` or the adapter's own instructions, and add its config in `lua/configs/dap.lua`. Only the UI/plumbing is wired up here, no adapters configured yet.

All custom plugin specs live in `lua/plugins/init.lua`; dap-specific setup is in `lua/configs/dap.lua`. Everything here is lazy-loaded — plugins won't load until their trigger (command, keymap, or file event) fires, consistent with this config's `defaults.lazy = true`.

# Credits

1) Lazyvim starter https://github.com/LazyVim/starter as nvchad's starter was inspired by Lazyvim's . It made a lot of things easier!

