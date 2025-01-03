local set = vim.keymap.set

-- Basic movement keybinds, these make navigating splits easy
-- set("n", "<c-j>", "<c-w><c-j>")
-- set("n", "<c-k>", "<c-w><c-k>")
-- set("n", "<c-l>", "<c-w><c-l>")
-- set("n", "<c-h>", "<c-w><c-h>")

set("n", "<leader>x", ":.lua<CR>", { desc = "Execute the current line" })
set("v", "<leader>x", ":lua<CR>", { desc = "Execute the current line" })
set("n", "<leader><leader>x", "<cmd>source %<CR>", { desc = "Execute the current file" })

-- Toggle hlsearch if it's on, otherwise just do "enter"
-- set("n", "<CR>", function()
--   ---@diagnostic disable-next-line: undefined-field
--   if vim.opt.hlsearch:get() then
--     vim.cmd.nohl()
--     return ""
--   else
--     return "<CR>"
--   end
-- end, { expr = true })

-- Tab navigation
set("n", "<M-1>", "gT")
set("n", "<M-2>", "gt")

set("n", "]d", vim.diagnostic.goto_next)
set("n", "[d", vim.diagnostic.goto_prev)

-- These mappings control the size of splits
set("n", "<M-,>", "<c-w>5<")
set("n", "<M-.>", "<c-w>5>")
set("n", "<M-t>", "<c-w>+")
set("n", "<M-s>", "<c-w>-")

set("n", "<M-j>", function()
  if vim.opt.diff:get() then
    vim.cmd [[normal! ]c]]
  else
    vim.cmd [[m .+1<CR>==]]
  end
end)

set("n", "<M-k>", function()
  if vim.opt.diff:get() then
    vim.cmd [[normal! [c]]
  else
    vim.cmd [[m .-2<CR>==]]
  end
end)
