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
set("n", "<M-1>", "gT", { desc = "Go to previous tab" })
set("n", "<M-2>", "gt", { desc = "Go to next tab" })

set("n", "]d", function()
    vim.diagnostic.jump({ count = 1, float = true })
  end,
  { desc = "Next diagnostic" }
)

set("n", "[d", function()
    vim.diagnostic.jump({ count = -1, float = true })
  end,
  { desc = "Previous diagnostic" }
)

-- These mappings control the size of splits
set("n", "<M-,>", "<c-w>5<", { desc = "Decrease window width" })
set("n", "<M-.>", "<c-w>5>", { desc = "Increase window width" })
set("n", "<M-t>", "<c-w>+", { desc = "Decrease window height" })
set("n", "<M-s>", "<c-w>-", { desc = "Decrease window height" })

set("n", "<M-j>", function()
    if vim.opt.diff:get() then
      vim.cmd [[normal! ]c]]
    else
      vim.cmd [[m .+1<CR>==]]
    end
  end,
  { desc = "Move line down" }
)

set("n", "<M-k>", function()
    if vim.opt.diff:get() then
      vim.cmd [[normal! [c]]
    else
      vim.cmd [[m .-2<CR>==]]
    end
  end,
  { desc = "Move line up" }
)
