return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  config = function()
    require('telescope').setup {
      pickers = {
        find_files = {
          theme = "ivy",
        }
      },
      extensions = {
        fzf = {}
      },
    }

    require('telescope').load_extension('fzf')
    require('telescope').load_extension('prosession')

    vim.keymap.set("n", "<leader>fk", require('telescope.builtin').keymaps, { desc = "[f]ind [k]eymaps" })
    vim.keymap.set("n", "<leader>fb", function()
        require('telescope.builtin').buffers {
          sort_mru = true,
          ignore_current_buffer = true,
        }
      end,
      { desc = "[f]ind open [b]uffers" }
    )
    vim.keymap.set("n", "<leader>fh", require('telescope.builtin').help_tags, { desc = "[f]ind [h]elp" })
    vim.keymap.set("n", "<leader>fd", require('telescope.builtin').find_files, { desc = "[f]ind files in [d]irectory" })
    vim.keymap.set("n", "<leader>en", function()
        require('telescope.builtin').find_files {
          cwd = vim.fn.stdpath("config")
        }
      end,
      { desc = "[e]dit [n]eovim config" }
    )
    vim.keymap.set("n", "<leader>ep", function()
        require('telescope.builtin').find_files {
          ---@diagnostic disable-next-line: param-type-mismatch
          cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")
        }
      end,
      { desc = "[e]dit [p]lugins" }
    )
    vim.keymap.set("n", "<leader>fp", "<cmd>Telescope prosession<CR>", { desc = "[f]ind [p]rosession" })

    require "config.telescope.multigrep".setup()
  end
}
