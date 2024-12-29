return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim",              -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
    -- Neotree
    vim.keymap.set("n", "\\", "<CMD>Neotree toggle current reveal_force_cwd<CR>",
      { desc = "Open Neotree in current file's directory" })
    vim.keymap.set("n", "|", "<CMD>Neotree reveal<CR>", { desc = "Open Neotree" })
  end,
}
