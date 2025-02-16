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
-- set("n", "<leader>", ":", { desc = "Command mode" })
-- set("n", "<leader>w", ":w<CR>", { desc = "[w]rite current buffer" })
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

-- TODO: need to look into making these better.
-- Right not the cursor remains on the new line. Would be useful to return it
-- to the current line in the same column position.
set("n", "]<space>", "o<ESC>", { desc = "Add line below" })
set("n", "[<space>", "O<ESC>", { desc = "Add line above" })

-- Add the current date
set("n", "<F7>", 'a<C-R>=strftime("%Y/%m/%d")<CR><Esc>', { desc = "Add current date" })

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
set("n", "J", "mzJ`z")
set("n", "<C-d>", "<C-d>zz")
set("n", "<C-u>", "<C-u>zz")
set("n", "n", "nzzzv")
set("n", "N", "Nzzzv")
set("v", "<M-j>", ":m '>+1<CR>gv=gv")
set("v", "<M-k>", ":m '<-2<CR>gv=gv")

-- greatest remap ever
set("x", "<leader>p", [["_dP]])
set("x", "<leader>d", [["_d]])

-- next greatest remap ever : asbjornHaland
-- set({"n", "v"}, "<leader>y", [["+y]])
-- set("n", "<leader>Y", [["+Y]])

-- This is going to get me cancelled
-- set("i", "<C-c>", "<Esc>")

-- set("n", "Q", "<nop>")
-- set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
set("n", "<leader>=", vim.lsp.buf.format)

-- set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
