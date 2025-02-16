-- lua/config/plugins/mini.lua
return {
  {
    'echasnovski/mini.nvim',
    enabled = true,
    version = false,
    config = function()
      local statusline = require 'mini.statusline'
      local spec_treesitter = require('mini.ai').gen_spec.treesitter
      statusline.setup { use_icons = true }
      require('mini.ai').setup({
        -- custom_objects = {
        --   F = spec_treesitter({ a = '@function.outer', i = '@function.inner' }),
        --   o = spec_treesitter({
        --     a = { '@conditional.outer', '@loop.outer' },
        --     i = { '@conditional.inner', '@loop.inner' },
        --   })
        -- },
      })
      require('mini.tabline').setup {}
      require('mini.pairs').setup {}
      require('mini.surround').setup {}
      require('mini.align').setup {}
      -- require('mini.map').setup{}
    end
  },
}
