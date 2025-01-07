return {
  {
    "neovim/nvim-lspconfig",
    enabled = true,
    dependencies = {
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      -- require("lspconfig").lua_ls.setup {}
      -- require("lspconfig").jedi_language_server.setup {}
      -- require("lspconfig").pylsp.setup {}

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then return end

          ---@diagnostic disable-next-line: param-type-mismatch, missing-parameter
          if client.supports_method('textDocument/implementation') then
            vim.keymap.set("n", "gd", vim.lsp.buf.implementation, { desc = "[g]o to [d]efinition" })
          end

          -- ---@diagnostic disable-next-line: param-type-mismatch, missing-parameter
          -- if client.supports_method('textDocument/completion') then
          --   -- Enable auto-completion
          --   vim.keymap.set("n", "<leader>.", vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true }))
          -- end

          ---@diagnostic disable-next-line: param-type-mismatch, missing-parameter
          if client.supports_method('textDocument/formatting') then
            -- Format the current buffer on save
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
              end,
            })
          end
        end
      })
    end,
  }
}
