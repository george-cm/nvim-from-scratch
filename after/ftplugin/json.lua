local set = vim.opt_local

set.shiftwidth = 4
set.number = true
set.relativenumber = true
set.foldmethod = "expr"
set.foldexpr = "nvim_treesitter#foldexpr()"
