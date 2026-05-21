# Neovim 0.12.0 Migration — Treesitter Changes

## Date
2026-04-08

## Problem
After upgrading to Neovim 0.12.0, two recurring errors appeared:

```
vim/treesitter.lua:196: attempt to call method 'range' (a nil value)
```

Affected both `nvim-treesitter-context` and the built-in treesitter highlighter.

## Root Cause
`nvim-treesitter` was on the `master` branch, which is incompatible with
Neovim 0.12.0. The `master` branch uses the old `nvim-treesitter.configs`
module, which was removed in the `main` branch rewrite. Parsers compiled
against the old branch produce nil nodes in the new treesitter runtime.

Reference: https://www.reddit.com/r/neovim/comments/1s9y00d/

## What Was Tried (and reverted)
`vim.g._ts_force_sync_parsing = true` in `init.lua` — did not fix the issue
because the root cause was the wrong plugin branch, not async parsing. This
change was reverted.

## Changes Applied

### 1. treesitter.lua — full rewrite
Switched `nvim-treesitter` from `master` to `main` branch. The new `main`
branch has a completely different API:
- `require('nvim-treesitter.configs').setup({...})` no longer exists
- `require('nvim-treesitter').setup()` only accepts `install_dir`
- Highlighting and indent are now Neovim built-in (no plugin config needed)
- Parser installation via `require('nvim-treesitter.install').install({...})`
- Auto-install handled via a `FileType` autocmd
- Large file guard via a `BufReadPost` autocmd that calls `vim.treesitter.stop()`

### 2. treesitter-textobjects.lua — full rewrite
Switched `nvim-treesitter-textobjects` from `master` to `main` branch:
- `require('nvim-treesitter-textobjects').setup({...})` with its own config
- Keymaps are now explicit `vim.keymap.set()` calls (no more `keymaps` table)
- Added `dependencies = { 'nvim-treesitter/nvim-treesitter' }` for load order

### 3. lazy-lock.json
Updated `nvim-treesitter-textobjects` entry from `master` to `main` branch
with the correct commit hash.

### 4. ~/.curlrc
Created `C:/Users/George.Murga/.curlrc` with `ssl-no-revoke` to bypass
Windows certificate revocation check errors during parser downloads:
```
CRYPT_E_NO_REVOCATION_CHECK (0x80092012)
```

### 5. Plugin directories
Deleted and re-cloned both `nvim-treesitter` and `nvim-treesitter-textobjects`
from the lazy data directory to get clean checkouts on `main`.

## Parsers Reinstalled
All 16 parsers compiled and installed successfully:
bash, python, c, lua, vim, vimdoc, query, markdown, markdown_inline,
json, javascript, html, go (+ 3 auto-detected).

## Files Modified
- `lua/config/plugins/treesitter.lua`
- `lua/config/plugins/treesitter-textobjects.lua`
- `lazy-lock.json`
- `~/.curlrc` (new file)
