--[[ LANE'S NEOVIM INIT ]]
--vim.keymap.set("n", "<Space>", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = " "
--vim.g.maplocalleader = "\\"

-- vim.loader = false
if vim.loader then
  vim.loader.enable()
  vim.schedule(function()
    vim.notify("nvim loader is enabled")
  end)
end

--vim.opt.compatible = false
vim.opt.clipboard = "unnamedplus"

-- Set current working dir to be dir of file
vim.opt.autochdir = true

-- Set title
vim.opt.title = true

vim.opt.termguicolors = true
vim.opt.background = "light"

-- Set stuff
vim.opt.number = true
vim.opt.laststatus = 2
vim.opt.showcmd = true
vim.opt.cursorline = true
vim.opt.wildmenu = true
vim.opt.showmatch = true
vim.opt.wrap = false
vim.opt.mouse = 'a'

-- splits behavior
vim.opt.splitbelow = true
vim.opt.splitright = true

-- indent behavior
vim.opt.autoindent = true
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.filetype = "on"

-- encoding
vim.opt.encoding = 'utf-8'
vim.opt.fileformat = 'unix'

-- searching
vim.opt.hlsearch = true
vim.opt.lazyredraw = false
vim.o.incsearch = false
vim.o.updatetime = 300
vim.wo.signcolumn = 'yes'

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

vim.api.nvim_create_user_command('Init', 'e ~/.config/nvim/init.lua', {})
vim.api.nvim_create_user_command('Plugins', 'e ~/.config/nvim/lua/plugins.lua', {})
vim.api.nvim_create_user_command('Reload', 'source ~/.config/nvim/init.lua', {})


--Map blankline
vim.g.indent_blankline_char = '┊' -- ┊
vim.g.indent_blankline_filetype_exclude = { 'help', 'packer' }
vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile' }
vim.g.indent_blankline_show_trailing_blankline_indent = false

vim.g.python3_host_prog = "/usr/bin/python3"

vim.g.rustfmt_autosave = 1
vim.g.rustfmt_emit_files = 1
vim.g.rustfmt_fail_silently = 0


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- load lazy
require("lazy").setup("plugins", {
	install = { colorscheme = { "Greymatters" } },
	defaults = { lazy = true },
	ui = {
		border = "rounded",
	},
	checker = { enabled = true },
	debug = false,
})

require("keymaps")
require("filetype")
