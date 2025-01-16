return {
  'mfussenegger/nvim-lint',
  config = function()
    local lint = require "lint"
    lint.linters_by_ft = {
      markdown = { "vale" },
      python = { "mypy" },
      bash = { "ShellCheck" },
    }
    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      callback = function()
        -- try linting without arguments runs the linters defined in `linters_by_ft`
        -- for the curret filetype
        require("lint").try_lint()
        -- You can call `try_lint` with a linter name or a list of names to always
        -- run specific linters, independent of the `linters_by_ft` configuration
        -- require("lint").try_lint("cspell")
      end
    })
  end,
}
