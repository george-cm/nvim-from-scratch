-- return {
--   "linux-cultist/venv-selector.nvim",
--   dependencies = {
--     "neovim/nvim-lspconfig",
--     "mfussenegger/nvim-dap", "mfussenegger/nvim-dap-python", --optional
--     { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
--   },
--   lazy = false,
--   branch = "regexp", -- This is the regexp branch, use this for the new version
--   config = function()
--     require("venv-selector").setup()
--   end,
--   keys = {
--     { ",v", "<cmd>VenvSelect<cr>" },
--   },
-- }
return {
  "linux-cultist/venv-selector.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } }, -- optional: you can also use fzf-lua, snacks, mini-pick instead.
  },
  ft = "python", -- Load when opening Python files
  keys = {
    { ",v", "<cmd>VenvSelect<cr>" }, -- Open picker on keymap
  },
  opts = { -- this can be an empty lua table - just showing below for clarity.
    search = {}, -- if you add your own searches, they go here.
    options = {}, -- if you add plugin options, they go here.
  },
}
