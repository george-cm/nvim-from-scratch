return {
  {
    "hrsh7th/nvim-cmp",
    lazy = false,
    priority = 100,
    dependencies = {
      "onsails/lspkind.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      {
        "L3MON4D3/LuaSnip",
        build = vim.fn.has("win32") == 0 and "make install_jsregexp" or nil,
      },
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      require("config.completion")
    end,
  },
}
