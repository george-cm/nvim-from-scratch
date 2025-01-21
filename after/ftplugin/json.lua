local set = vim.opt_local

set.shiftwidth = 4
set.number = true
set.relativenumber = true
set.foldmethod = "expr"
set.foldexpr = "v:lua.vim.treesitter.foldexpr()"
set.foldcolumn = "0"
-- set.foldtext = ""
set.foldlevel = 99
set.foldlevelstart = 1
-- set.foldenextmax = 4
