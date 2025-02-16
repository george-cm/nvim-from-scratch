return {
  'stevearc/conform.nvim',
  dependencies = {
    { 'wesleimp/stylua.nvim' },
  },
  opts = {},
  config = function()
    require("conform").setup {
      formatters_by_ft = {
        lua = { "stylelua" },
        python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
        javascript = { "prettierd", "prettier", stop_after_first = true },
        bash = { "shfmt", "shellharden", "shellcheck" },
      },
      async = true,
      format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 1000,
        lsp_format = "fallback",
      }
    }
  end
}
