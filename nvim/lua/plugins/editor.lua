return {
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{ "nvim-tree/nvim-web-devicons" },
	{ "nvim-lualine/lualine.nvim", lazy = false, dependencies = { "nvim-tree/nvim-web-devicons" } },
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		opts = {
			options = {
				mode = "tabs",
				always_show_bufferline = false,
				separator_style = "slant",
			},
		},
	},
	{ "numToStr/Comment.nvim", event = "VeryLazy", opts = {} },
	{
		"nvim-tree/nvim-tree.lua",
		opts = {
			view = { width = 34, side = "left" },
			renderer = { group_empty = true },
			filters = { dotfiles = false },
		},
	},
	{ "folke/which-key.nvim", event = "VeryLazy", opts = {} },
	{ "luxvim/nvim-luxterm" },
	{ "sethen/line-number-change-mode.nvim" },
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		event = "VeryLazy",
		opts = {
			indent = { char = "|" },
			scope = { enabled = false },
		},
	},
}
