-- Lazy nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		lazyrepo,
		lazypath,
	})
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- Configure and install plugins
--
-- To check the current status of your plugins, run
--    :Lazy
--
-- You can press `?` in this menu for help. Use `:q` to close the window
--
-- To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.

-- require('lazy').setup({
--   'tpope/vim-sleuth',
--  'numToStr/Comment.nvim',
--  'lewis6991/gitsigns.nvim',
--})

require("lazy").setup({
	"nvim-tree/nvim-tree.lua",
	"nvim-tree/nvim-web-devicons",
	{
		"onsails/lspkind.nvim",
		event = { "VimEnter" },
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"lspkind.nvim",
			"hrsh7th/cmp-nvim-lsp", -- lsp auto-completion
			"hrsh7th/cmp-buffer", -- buffer auto-completion
			"hrsh7th/cmp-path", -- path auto-completion
			"hrsh7th/cmp-cmdline", -- cmdline auto-completion
		},
		config = function()
			require("nayan.plugins.nvim-cmp")
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
	},
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	"stevearc/conform.nvim",
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	"lewis6991/gitsigns.nvim",
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
})

require("nayan.plugins.nerd-tree")
require("nayan.plugins.lsp")
require("nayan.plugins.conform")
require("nayan.plugins.telescope")
require("nayan.plugins.gitsigns")
