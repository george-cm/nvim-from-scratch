return {
  "stevearc/conform.nvim",
  dependencies = {
    { "wesleimp/stylua.nvim" },
  },
  opts = {},
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
        javascript = { "prettierd", "prettier", stop_after_first = true },
        bash = { "shfmt", "shellharden", "shellcheck" },
        markdown = { "markdownlint-cli2" }, -- , "cbfmt", "doctoc", "markdownfmt" },
        toml = { "pyproject-fmt" },
      },
      async = true,
      format_after_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 1000,
        lsp_format = "fallback",
      },
    })
  end,
}
