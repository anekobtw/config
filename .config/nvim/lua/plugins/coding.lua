return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter").setup({})
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			local npairs = require("nvim-autopairs")
			npairs.setup({})

			local cmp_ok, cmp = pcall(require, "cmp")
			if cmp_ok then
				local cmp_autopairs = require("nvim-autopairs.completion.cmp")
				cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
			end
		end,
	},
	{ "lewis6991/gitsigns.nvim", opts = {} },
	{ "windwp/nvim-ts-autotag", opts = {} },
	{ "kylechui/nvim-surround", event = "VeryLazy", opts = {} },
}
