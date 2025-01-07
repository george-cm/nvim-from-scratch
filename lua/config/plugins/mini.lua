-- lua/config/plugins/mini.lua
return {
  {
    'echasnovski/mini.nvim',
    enabled = true,
    version = false,
    config = function()
      local statusline = require 'mini.statusline'
      statusline.setup { use_icons = true }
      require('mini.ai').setup {}
      require('mini.tabline').setup {}
      require('mini.pairs').setup {}
      require('mini.surround').setup {}
      -- require('mini.map').setup{}
    end
  },
}
