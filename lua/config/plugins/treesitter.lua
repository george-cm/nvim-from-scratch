return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    enabled = true,
    build = ':TSUpdate',
    config = function()
      -- main branch setup() only accepts install_dir; all other options are gone
      require('nvim-treesitter').setup()

      -- Install parsers on startup
      require('nvim-treesitter.install').install({
        'bash', 'python', 'c', 'lua', 'vim', 'vimdoc', 'query',
        'markdown', 'markdown_inline', 'json', 'javascript', 'html', 'go',
      })

      -- Auto-install missing parser when opening a buffer, then start highlighting
      vim.api.nvim_create_autocmd('FileType', {
        callback = function(args)
          local lang = vim.treesitter.language.get_lang(args.match)
          if not lang then return end
          if not pcall(vim.treesitter.language.add, lang) then
            require('nvim-treesitter.install').install({ lang })
          else
            pcall(vim.treesitter.start, args.buf, lang)
          end
        end,
      })

      -- Disable treesitter highlighting for large files (>100 KB)
      vim.api.nvim_create_autocmd('BufReadPost', {
        callback = function(args)
          local max_filesize = 100 * 1024
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(args.buf))
          if ok and stats and stats.size > max_filesize then
            vim.treesitter.stop(args.buf)
          end
        end,
      })
    end,
  },
}
