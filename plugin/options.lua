local opt = vim.opt

------ Interesting Options ------

-- You have to turn this one on :)
opt.inccommand = "split"

-- Best search settings :)
opt.smartcase = true
opt.ignorecase = true

------ Personal Preferences ------
opt.shiftwidth = 4
opt.number = true
opt.relativenumber = true

opt.splitbelow = true
opt.splitright = true

opt.signcolumn = "yes"
opt.shada = { "'10", "<0", "s10", "h" }

opt.clipboard = "unnamedplus"

-- Don't have `o` add a comment
opt.formatoptions:remove "o"

-- The Primeagen
-- opt.guicursor = ""

opt.nu = true
opt.relativenumber = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.smartindent = true

opt.wrap = false

-- opt.swapfile = false
-- opt.backup = false
opt.undodir = vim.loop.os_homedir() .. "/.undodir"
opt.undofile = true

-- opt.hlsearch = false
-- opt.incsearch = true

-- opt.termguicolors = true

opt.scrolloff = 8
opt.isfname:append("@-@")

-- opt.updatetime = 50

opt.colorcolumn = "80"

vim.diagnostic.config({
  jump = { foat = true },
  virtual_text = {
    source = true,
  },
  float = {
    source = true,
  },
})
