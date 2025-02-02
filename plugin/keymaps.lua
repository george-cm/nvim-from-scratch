local set = vim.keymap.set

-- Basic movement keybinds, these make navigating splits easy
-- set("n", "<c-j>", "<c-w><c-j>")
-- set("n", "<c-k>", "<c-w><c-k>")
-- set("n", "<c-l>", "<c-w><c-l>")
-- set("n", "<c-h>", "<c-w><c-h>")

set("n", "<leader>x", ":.lua<CR>", { desc = "Execute the current line" })
set("v", "<leader>x", ":lua<CR>", { desc = "Execute the current line" })
set("n", "<leader><leader>x", "<cmd>source %<CR>", { desc = "Execute the current file" })

set("n", "<leader><leader>", "<cmd>nohls<CR>", { desc = "Turn off search highlight" })
set("n", "<leader>", ":", { desc = "Command mode" })
set("n", "<leader>w", ":w<CR>", { desc = "[w]rite current buffer" })
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

-- set("n", "]d", function()
--     vim.diagnostic.jump({ count = 1, float = true })
--   end,
--   { desc = "Next diagnostic" }
-- )
-- set("n", "[d", function()
--     vim.diagnostic.jump({ count = -1, float = true })
--   end,
--   { desc = "Previous diagnostic" }
-- )

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

-- The Primeagen
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
-- vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
-- vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
-- vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
-- vim.keymap.set("n", "<leader>Y", [["+Y]])

-- This is going to get me cancelled
-- vim.keymap.set("i", "<C-c>", "<Esc>")

-- vim.keymap.set("n", "Q", "<nop>")
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
