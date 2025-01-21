return {
  'famiu/bufdelete.nvim',
  config = function()
    vim.keymap.set('n', '<leader>q', function()
        require('bufdelete').bufdelete(0)
      end,
      { desc = '[q]uit current buffer without killing the window' })
  end
}
