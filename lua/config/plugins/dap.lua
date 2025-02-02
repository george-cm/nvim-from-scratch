return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "mfussenegger/nvim-dap-python",
      "leoluz/nvim-dap-go",
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-neotest/nvim-nio",
      -- "williamboman/mason.nvim",
    },
    config = function()
      local dap = require "dap"
      local ui = require "dapui"

      require("dapui").setup()
      require("dap-go").setup()
      require("dap-python").setup(
        "C:/Users/George.Murga/AppData/Local/nvim-fromscratch-data/mason/packages/debugpy/venv/Scripts/python.exe")

      require("nvim-dap-virtual-text").setup {
        -- This just tries to mitigate the chance that I leak tokens here. Probably won't stop it from happening...
        display_callback = function(variable)
          -- local name = string.lower(variable.name)
          -- local value = string.lower(variable.value)
          -- if name:match "secret" or name:match "api" or value:match "secret" or value:match "api" then
          --   return "*****"
          -- end

          if #variable.value > 15 then
            return " " .. string.sub(variable.value, 1, 15) .. "... "
          end
        end,
      }

      -- Handled by nvim-dap-go
      -- dap.adapters.go = {
      --   type = "server",
      --   port = "${port}",
      --   executable = {
      --     command = "dlv",
      --     args = { "dap", "-l", "127.0.0.1:${port}" },
      --   },
      -- }


      vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "toggle [b]reakpoint" })
      vim.keymap.set("n", "<leader>gb", dap.run_to_cursor, { desc = "[g]o to [b]reakpoint (run to cursor)" })

      -- Eval var under cursor
      vim.keymap.set("n", "<leader>?", function()
          require("dapui").eval(nil, { enter = true })
        end,
        { desc = "[?]eval var under cursor" }
      )

      vim.keymap.set("n", "<F1>", dap.continue, { desc = "debug continue" })
      vim.keymap.set("n", "<F2>", dap.step_into, { desc = "debug step into" })
      vim.keymap.set("n", "<F3>", dap.step_over, { desc = "debug step over" })
      vim.keymap.set("n", "<F4>", dap.step_out, { desc = "debug step out" })
      vim.keymap.set("n", "<F5>", dap.step_back, { desc = "debug step back" })
      vim.keymap.set("n", "<F12>", dap.restart, { desc = "debug restart" })

      dap.listeners.before.attach.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        ui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        ui.close()
      end
    end,
  }
}
