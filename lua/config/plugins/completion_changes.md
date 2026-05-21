# Changes Made to completion.lua

## Date
2026-04-08

## File Modified
`C:/Users/George.Murga/AppData/Local/nvim-fromscratch/lua/config/plugins/completion.lua`

## Backup
`C:/Users/George.Murga/AppData/Local/nvim-fromscratch/lua/config/plugins/completion.lua.bak`

## Problem
LuaSnip's build step was failing on Windows with:
```
sed: bad option in substitution expression
make[1]: *** [Makefile:121: install_jsregexp] Error 1
```
The `make install_jsregexp` command uses GNU/Linux `sed` syntax incompatible with Windows.

## Change
**Before:**
```lua
build = "make install_jsregexp CC=gcc.exe SHELL=C:/Users/George.Murga/scoop/apps/w64devkit/current/bin/sh.exe .SHELLFLAGS=-c NEOVIM_BIN_PATH=C:/Users/George.Murga/scoop/apps/neovim/current/bin",
```

**After:**
```lua
build = vim.fn.has("win32") == 0 and "make install_jsregexp" or nil,
```

## Reason
`jsregexp` is an optional LuaSnip dependency. On Windows, the build fails due
to `sed` incompatibility in the jsregexp Makefile. This change skips the build
on Windows (`win32 == 1`) while keeping it active on Linux/macOS.
