vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local os_string = vim.loop.os_uname().sysname
local wsl_distro_name = os.getenv "WSL_DISTRO_NAME"

-- If running in WSL then fix paste
-- if wsl_distro_name then
--   vim.g.clipboard = {
--     name = "WslClipboard",
--     copy = {
--       ["+"] = "clip.exe",
--       ["*"] = "clip.exe",
--     },
--     paste = {
--       ["+"] =
--       'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
--       ["*"] =
--       'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
--     },
--     cache_enabled = 0,
--   }
-- end

-- Set default terminal shell
if os_string == 'Windows_NT' then
  vim.opt.shell = vim.fn.executable 'pwsh' and 'pwsh' or 'powershell'
  -- vim.opt.shell = 'pwsh'
  vim.opt.shellcmdflag =
  '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
  vim.opt.shellredir = '-RedirectStandardOutput %s -NoNewWindow -Wait'
  vim.opt.shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
  vim.opt.shellquote = ''
  vim.opt.shellxquote = ''
  -- vim.g.python3_host_prog = vim.fn.getenv('USERPROFILE'):gsub('\\', '/') .. '/.venv_nvim/Scripts/python.exe'
  vim.g.python3_host_prog = vim.fn.getenv('USERPROFILE') .. '\\.venv_nvim\\Scripts\\python.exe'
else
  --   vim.opt.shell = os.getenv 'SHELL' or '/usr/bin/env bash'
  vim.g.python3_host_prog = '~/.venv_nvim/bin/python'
end

require("config.lazy")

--   Trey it with `yap` in normal mode
--   See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
